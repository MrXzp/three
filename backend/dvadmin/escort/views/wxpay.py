# -*- coding: utf-8 -*-
"""
微信支付 V3 - 商家转账到零钱 工具模块
https://pay.weixin.qq.com/docs/partner/applications/partner/batch-transfer-to-balance.html

依赖证书文件（放在 conf/ 目录下）：
  apiclient_key.pem   - 商户私钥（用于对请求签名）
  apiclient_cert.pem  - 商户证书（用于 TLS 客户端认证）
  wechatpay_cert.pem  - 微信平台证书（用于验签回调通知，从 APIv3 获取证书接口下载）
"""
import base64
import hashlib
import json
import random
import ssl
import string
import time
import urllib.request
import urllib.error
from pathlib import Path

from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import hashes, serialization
from cryptography.hazmat.primitives.asymmetric import padding
from cryptography.hazmat.primitives.serialization import load_pem_private_key
from cryptography.x509 import load_pem_x509_certificate
from OpenSSL import crypto

from django.conf import settings


# ============================================================
# 基础工具
# ============================================================

def _random_str(length=32):
    chars = string.ascii_letters + string.digits
    return ''.join(random.choices(chars, k=length))


def _get_serial_number(cert_file: str) -> str:
    """从 PEM 证书中提取序列号（十六进制字符串，无冒号）"""
    with open(cert_file, 'r', encoding='utf-8') as f:
        cert = crypto.load_certificate(crypto.FILETYPE_PEM, f.read())
    serial = cert.get_serial_number()
    return hex(serial)[2:].upper()


# ============================================================
# V3 签名（RSA + SHA256）
# ============================================================

def _rsa_sign(message: str, private_key_file: str) -> str:
    """RSA-SHA256 签名，返回 Base64 编码的签名字符串"""
    with open(private_key_file, 'r', encoding='utf-8') as f:
        key_data = f.read()
    private_key = load_pem_private_key(
        key_data.encode('utf-8'), password=None, backend=default_backend()
    )
    sign = private_key.sign(
        message.encode('utf-8'),
        padding.PKCS1v15(),
        hashes.SHA256()
    )
    return base64.b64encode(sign).decode('utf-8')


def _verify_sign(message: str, signature_b64: str, cert_file: str) -> bool:
    """用 PEM 证书验证 RSA-SHA256 签名"""
    try:
        with open(cert_file, 'r', encoding='utf-8') as f:
            cert_data = f.read()
        cert = load_pem_x509_certificate(cert_data.encode('utf-8'), default_backend())
        public_key = cert.public_key()
        public_key.verify(
            base64.b64decode(signature_b64),
            message.encode('utf-8'),
            padding.PKCS1v15(),
            hashes.SHA256()
        )
        return True
    except Exception:
        return False


def _build_v3_sign(method: str, url_path: str, timestamp: str, nonce: str, body: str) -> str:
    """
    构建 V3 接口签名串，按微信官方规范：
    <method>\n<url_path>\n<timestamp>\n<nonce>\n<body>\n
    """
    return f"{method}\n{url_path}\n{timestamp}\n{nonce}\n{body}\n"


def _make_v3_auth_header(private_key_file: str, mchid: str) -> str:
    """
    构建 V3 Authorization 头
    """
    return None  # 动态计算，见 wxpay_transfer


# ============================================================
# 请求发送
# ============================================================

def _v3_request(
    method: str,
    url_path: str,
    body_dict: dict,
    private_key_file: str,
    cert_file: str,
) -> tuple:
    """
    发送 V3 API 请求，返回 (status_code, response_dict)
    cert_file 用于 TLS 双向认证
    """
    import logging
    logger = logging.getLogger('django.request')

    timestamp = str(int(time.time()))
    nonce = _random_str(32)
    body = json.dumps(body_dict, ensure_ascii=False) if body_dict else ''
    logger.warning(f"[WXPAY DEBUG] raw_body={repr(body)}")

    # 签名
    sign_str = _build_v3_sign(method, url_path, timestamp, nonce, body)
    signature = _rsa_sign(sign_str, private_key_file)
    serial_no = _get_serial_number(cert_file)

    import logging
    logger = logging.getLogger('django.request')

    # Authorization 头（字段顺序必须与微信官方一致：mchid, nonce_str, signature, timestamp, serial_no）
    auth = (
        f'WECHATPAY2-SHA256-RSA2048 '
        f'mchid="{settings.WECHAT_MCHID}", '
        f'nonce_str="{nonce}", '
        f'signature="{signature}", '
        f'timestamp="{timestamp}", '
        f'serial_no="{serial_no}"'
    )

    # DEBUG 日志
    logger.warning(f"[WXPAY DEBUG] auth={auth}")
    logger.warning(f"[WXPAY DEBUG] sign_str={repr(sign_str)}")
    logger.warning(f"[WXPAY DEBUG] serial_no={serial_no}, cert_file={cert_file}")

    url = f"https://api.mch.weixin.qq.com{url_path}"
    headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': auth,
        'Accept': 'application/json',
        'User-Agent': 'wechatpay python sdk v2.0.2',
    }

    ctx = ssl.SSLContext(ssl.PROTOCOL_TLS_CLIENT)
    ctx.load_default_certs(ssl.Purpose.SERVER_AUTH)
    ctx.check_hostname = True
    ctx.verify_mode = ssl.CERT_REQUIRED
    # 加载商户证书 + 私钥，用于 TLS 双向认证（mTLS）
    ctx.load_cert_chain(cert_file, keyfile=private_key_file)

    req = urllib.request.Request(
        url,
        data=body.encode('utf-8') if body else None,
        headers=headers,
        method=method,
    )

    with urllib.request.urlopen(req, timeout=30, context=ctx) as resp:
        status = resp.status
        resp_body = resp.read().decode('utf-8')
        try:
            resp_data = json.loads(resp_body) if resp_body else {}
        except Exception:
            resp_data = {'raw': resp_body}
        return status, resp_data


# ============================================================
# 商家转账到零钱（V3）
# ============================================================

# ============================================================
# 商家转账到零钱（V3）- 免确认模式
# ============================================================

def wxpay_authorize_and_transfer(
    out_bill_no: str,
    openid: str,
    amount: int,
    desc: str = '提现',
) -> dict:
    """
    商家转账到零钱 - 免确认模式（用户授权后直接打款）
    https://pay.weixin.qq.com/doc/v3/merchant/4012716434

    流程：先发起授权 -> 再调用授权后转账，微信直接打款到用户零钱，无需用户确认。

    参数:
        out_bill_no:  商户单号（唯一，不能重复）
        openid:       用户 openid
        amount:       金额，单位：分（int）
        desc:         付款描述（UTF8，最多32字符）

    返回:
        成功: {'code': 'SUCCESS', 'state': 'SUCCESS', 'transfer_bill_no': ...}
        失败: {'code': 'FAIL', 'error_code': ..., 'error_message': ...}
        未授权: {'code': 'NEED_AUTH', 'authorization_id': ..., 'package_info': ...}
    """
    import logging
    logger = logging.getLogger('django.request')

    key_file = settings.WECHAT_API_V3_KEY_FILE
    cert_file = settings.WECHAT_API_V3_CERT_FILE

    desc = desc[:32]

    # Step 1: 调用「发起免确认收款授权」接口，获取授权
    auth_result = _request_wx_authorization(openid)
    if auth_result.get('code') == 'FAIL':
        return auth_result

    authorization_id = auth_result.get('authorization_id')
    logger.warning(f"[WXPAY] Authorization obtained: {authorization_id}")

    # Step 2: 调用「用户授权后转账」接口，直接打款
    body = {
        'appid': settings.WECHAT_MINI_APPID,
        'out_bill_no': out_bill_no,
        'authorization_id': authorization_id,
        'openid': openid,
        'transfer_amount': amount,
        'transfer_remark': desc,
        'transfer_scene_id': getattr(settings, 'WECHAT_TRANSFER_SCENE_ID', '1000'),
        'user_recv_perception': desc,
    }

    try:
        status, resp = _v3_request(
            method='POST',
            url_path='/v3/fund-app/mch-transfer/transfer-bills',
            body_dict=body,
            private_key_file=key_file,
            cert_file=cert_file,
        )

        if status == 200:
            logger.warning(f"[WXPAY DEBUG] SUCCESS resp={resp}")
            return {
                'code': 'SUCCESS',
                'state': resp.get('state'),
                'transfer_bill_no': resp.get('transfer_bill_no'),
                'out_bill_no': out_bill_no,
            }
        else:
            err_code = resp.get('code', str(status))
            # 未授权：用户尚未完成授权，引导用户去授权
            if err_code == 'INVALID_REQUEST':
                msg = resp.get('message', '')
                if 'AUTH' in msg.upper() or '授权' in msg:
                    return {
                        'code': 'NEED_AUTH',
                        'error_code': err_code,
                        'error_message': '用户尚未授权，请引导用户先完成授权',
                    }
            logger.warning(f"[WXPAY DEBUG] FAIL status={status} resp={resp}")
            return {
                'code': 'FAIL',
                'error_code': err_code,
                'error_message': resp.get('message', resp.get('detail', str(resp))),
            }
    except urllib.error.HTTPError as e:
        err_body_str = e.read().decode('utf-8')
        logger.warning(f"[WXPAY DEBUG] HTTPError status={e.code} body={err_body_str}")
        try:
            err_body = json.loads(err_body_str)
        except Exception:
            err_body = {'message': err_body_str}
        return {
            'code': 'FAIL',
            'error_code': err_body.get('code', str(e.code)),
            'error_message': err_body.get('message', str(err_body)),
        }
    except Exception as e:
        return {'code': 'FAIL', 'error_code': 'NETWORK_ERROR', 'error_message': str(e)}


def _request_wx_authorization(openid: str) -> dict:
    """
    Step 1: 调用「发起免确认收款授权」接口
    https://pay.weixin.qq.com/doc/v3/merchant/4012716434

    获取 authorization_id，用于后续的授权后转账。
    """
    import logging
    logger = logging.getLogger('django.request')

    key_file = settings.WECHAT_API_V3_KEY_FILE
    cert_file = settings.WECHAT_API_V3_CERT_FILE

    out_authoriztion_no = f"AUTH{int(time.time()*1000)}{random.randint(1000,9999)}"

    body = {
        'appid': settings.WECHAT_MINI_APPID,
        'out_authoriztion_no': out_authoriztion_no,
        'openid': openid,
        'authorization_scene': {
            'type': 'ADD_BALANCE',  # 充值场景
        },
    }

    try:
        status, resp = _v3_request(
            method='POST',
            url_path='/v3/fund-app/mch-transfer/authorizations',
            body_dict=body,
            private_key_file=key_file,
            cert_file=cert_file,
        )

        if status == 200:
            logger.warning(f"[WXPAY] Authorization resp={resp}")
            return {
                'code': 'SUCCESS',
                'authorization_id': resp.get('authorization_id'),
                'package_info': resp.get('package_info'),
            }
        else:
            logger.warning(f"[WXPAY] Authorization FAIL status={status} resp={resp}")
            return {
                'code': 'FAIL',
                'error_code': resp.get('code', str(status)),
                'error_message': resp.get('message', resp.get('detail', str(resp))),
            }
    except urllib.error.HTTPError as e:
        err_body_str = e.read().decode('utf-8')
        logger.warning(f"[WXPAY] Authorization HTTPError status={e.code} body={err_body_str}")
        try:
            err_body = json.loads(err_body_str)
        except Exception:
            err_body = {'message': err_body_str}
        return {
            'code': 'FAIL',
            'error_code': err_body.get('code', str(e.code)),
            'error_message': err_body.get('message', str(err_body)),
        }
    except Exception as e:
        return {'code': 'FAIL', 'error_code': 'NETWORK_ERROR', 'error_message': str(e)}


# ============================================================
# 查询转账单（V3）
# ============================================================

def wxpay_query_transfer_by_out_no(out_bill_no: str) -> dict:
    """
    通过商户单号查询转账单
    https://pay.weixin.qq.com/doc/v3/merchant/4012716437
    """
    key_file = settings.WECHAT_API_V3_KEY_FILE
    cert_file = settings.WECHAT_API_V3_CERT_FILE
    url_path = f'/v3/fund-app/mch-transfer/transfer-bills/out-bill-no/{out_bill_no}'

    try:
        status, resp = _v3_request(
            method='GET',
            url_path=url_path,
            body_dict=None,
            private_key_file=key_file,
            cert_file=cert_file,
        )
        return resp
    except Exception as e:
        return {'code': 'FAIL', 'error_message': str(e)}


# ============================================================
# 查询转账批次单详情（V3）
# ============================================================

def wxpay_query_transfer(
    out_batch_no: str = None,
    batch_id: str = None,
    need_query_detail: bool = True,
    detail_id: str = None,
    offset: int = 0,
    limit: int = 20,
) -> dict:
    """
    查询商家转账批次单
    out_batch_no 和 batch_id 至少传一个
    """
    key_file = settings.WECHAT_API_V3_KEY_FILE
    cert_file = settings.WECHAT_API_V3_CERT_FILE

    params = []
    if out_batch_no:
        params.append(f'out_batch_no={out_batch_no}')
    if batch_id:
        params.append(f'batch_id={batch_id}')
    params.append(f'need_query_detail={"true" if need_query_detail else "false"}')
    params.append(f'offset={offset}')
    params.append(f'limit={limit}')
    if detail_id:
        params.append(f'detail_id={detail_id}')

    query = '&'.join(params)
    url_path = f'/v3/transfer/batches?{query}'

    try:
        status, resp = _v3_request(
            method='GET',
            url_path=url_path,
            body_dict=None,
            private_key_file=key_file,
            cert_file=cert_file,
        )
        return resp
    except Exception as e:
        return {'code': 'FAIL', 'error_message': str(e)}


# ============================================================
# 回调通知解密与验签（V3）
# ============================================================

def verify_wx_notify(request) -> tuple:
    """
    验证微信 V3 回调通知的签名，并解密回调内容
    返回 (True/False, decrypted_body_dict)
    """
    # 1. 从请求头获取签名信息
    headers = {k.lower(): v for k, v in request.headers.items()}
    auth_header = headers.get('authorization', '')
    wechat_serial = headers.get('wechatpay-serial', '')

    # 解析 Authorization 头
    try:
        parts = dict(p.strip().split('=', 1) for p in auth_header.split(',') if '=' in p)
        signature_b64 = parts.get('signature', '')
        nonce = parts.get('nonce_str', '')
        timestamp = parts.get('timestamp', '')
    except Exception:
        return False, {}

    # 2. 读取原始回调体
    body_raw = request.body.decode('utf-8')
    if not body_raw:
        return False, {}

    # 3. 验证签名：待签名字符串 = timestamp + nonce + body
    #    微信平台证书 serial 对应 headers['wechatpay-serial']
    platform_cert = settings.WECHAT_PAY_PLATFORM_CERT
    sign_message = f"{timestamp}\n{nonce}\n{body_raw}\n"
    if not _verify_sign(sign_message, signature_b64, platform_cert):
        return False, {}

    # 4. 解密敏感数据（AES-256-GCM）
    try:
        body_obj = json.loads(body_raw)
        ciphertext = body_obj.get('resource', {}).get('ciphertext', '')
        nonce_str = body_obj.get('resource', {}).get('nonce', '')
        associated_data = body_obj.get('resource', {}).get('associated_data', '')
        if ciphertext:
            plaintext = _aes_gcm_decrypt(ciphertext, nonce_str, associated_data,
                                         settings.WECHAT_API_V3_KEY)
            decrypted = json.loads(plaintext)
            return True, decrypted
        return True, body_obj
    except Exception:
        return True, {}


def _aes_gcm_decrypt(ciphertext_b64: str, nonce: str, associated_data: str, api_key: str) -> str:
    """
    AES-256-GCM 解密
    api_key: 调账密钥（从商户平台获取，32字节）
    """
    import base64
    try:
        from cryptography.hazmat.primitives.ciphers.aead import AESGCM
    except ImportError:
        # cryptography 未安装，用 pycryptodome
        from Crypto.Cipher import AES
        from base64 import b64decode

        key_bytes = api_key.encode('utf-8')
        nonce_bytes = nonce.encode('utf-8')
        aad_bytes = associated_data.encode('utf-8')
        ciphertext_bytes = b64decode(ciphertext_b64)

        # 前 12 字节是 nonce（但这里 nonce 独立传了）
        cipher = AES.new(key_bytes, AES.MODE_GCM, nonce=nonce_bytes)
        cipher.update(aad_bytes)
        # GCM 解密最后 16 字节是 tag（附加在 ciphertext 后）
        # AESGCM.open() 会自动处理 tag；pycryptodome 需要手动切
        # 这里 ciphertext 里包含密文+tag（最后16字节）
        tag = ciphertext_bytes[-16:]
        ct = ciphertext_bytes[:-16]
        cipher_text, verified_tag = cipher.decrypt_and_verify(ct, tag)
        return cipher_text.decode('utf-8')

    key_bytes = api_key.encode('utf-8')
    nonce_bytes = nonce.encode('utf-8')
    aad_bytes = associated_data.encode('utf-8')
    ciphertext_bytes = base64.b64decode(ciphertext_b64)

    aesgcm = AESGCM(key_bytes)
    plaintext = aesgcm.decrypt(nonce_bytes, ciphertext_bytes, aad_bytes)
    return plaintext.decode('utf-8')
