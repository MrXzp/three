# -*- coding: utf-8 -*-
"""
微信支付 V3 - 商家转账到零钱 工具模块（新版）
https://pay.weixin.qq.com/docs/partner/applications/partner/batch-transfer-to-balance.html

依赖证书文件（放在 conf/ 目录下）：
  apiclient_key.pem   - 商户私钥（用于对请求签名）
  apiclient_cert.pem  - 商户证书（用于 TLS 客户端认证）
"""
import base64
import json
import random
import ssl
import string
import time
import urllib.request
import urllib.error
from pathlib import Path

from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import hashes
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


def _build_v3_sign(method: str, url_path: str, timestamp: str, nonce: str, body: str) -> str:
    """构建 V3 接口签名串"""
    return f"{method}\n{url_path}\n{timestamp}\n{nonce}\n{body}\n"


# ============================================================
# 请求发送
# ============================================================

def _v3_request(
    method: str,
    url_path: str,
    body_dict: dict = None,
) -> tuple:
    """
    发送 V3 API 请求，返回 (status_code, response_dict)
    """
    import logging
    logger = logging.getLogger('django.request')

    private_key_file = settings.WECHAT_API_V3_KEY_FILE
    cert_file = settings.WECHAT_API_V3_CERT_FILE

    timestamp = str(int(time.time()))
    nonce = _random_str(32)
    body = json.dumps(body_dict, ensure_ascii=False) if body_dict else ''
    
    # 签名
    sign_str = _build_v3_sign(method, url_path, timestamp, nonce, body)
    signature = _rsa_sign(sign_str, private_key_file)
    serial_no = _get_serial_number(cert_file)

    # Authorization 头（无空格分隔）
    auth = (
        f'WECHATPAY2-SHA256-RSA2048 '
        f'mchid="{settings.WECHAT_MCHID}",'
        f'nonce_str="{nonce}",'
        f'signature="{signature}",'
        f'timestamp="{timestamp}",'
        f'serial_no="{serial_no}"'
    )

    base_url = 'https://api.mch.weixin.qq.com'
    url = f"{base_url}{url_path}"

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
    ctx.load_cert_chain(cert_file, keyfile=private_key_file)

    req = urllib.request.Request(
        url,
        data=body.encode('utf-8') if body else None,
        headers=headers,
        method=method,
    )

    try:
        with urllib.request.urlopen(req, timeout=30, context=ctx) as resp:
            status = resp.status
            resp_body = resp.read().decode('utf-8')
            try:
                resp_data = json.loads(resp_body) if resp_body else {}
            except Exception:
                resp_data = {'raw': resp_body}
            return status, resp_data
    except urllib.error.HTTPError as e:
        err_body_str = e.read().decode('utf-8')
        logger.warning(f"[WXPAY] HTTPError status={e.code} body={err_body_str}")
        try:
            err_data = json.loads(err_body_str) if err_body_str else {}
        except Exception:
            err_data = {'message': err_body_str}
        return e.code, err_data
    except Exception as e:
        logger.error(f"[WXPAY] Exception: {e}")
        return 500, {'message': str(e)}


# ============================================================
# 商家转账到零钱 - V3 新版单笔转账
# ============================================================

def wxpay_transfer(
    out_bill_no: str,
    openid: str,
    amount: int,
    desc: str = '余额提现',
) -> dict:
    """
    商家转账到零钱 - 新版 V3 单笔转账（用户确认收款模式）
    https://pay.weixin.qq.com/doc/v3/merchant/4012716434
    
    参数:
        out_bill_no: 商户单号（唯一，不能重复）
        openid: 用户 openid
        amount: 金额，单位：分（int）
        desc: 转账备注（用户可见，最多32字符）
    
    返回:
        成功: {'code': 'SUCCESS', 'state': 'WAIT_USER_CONFIRM', 'package_info': ..., 'transfer_bill_no': ...}
        失败: {'code': 'FAIL', 'error_code': ..., 'error_message': ...}
    """
    import logging
    logger = logging.getLogger('django.request')

    desc = desc[:32]

    body = {
        'appid': settings.WECHAT_MINI_APPID,
        'out_bill_no': out_bill_no,
        'transfer_scene_id': getattr(settings, 'WECHAT_TRANSFER_SCENE_ID', '1005'),
        'openid': openid,
        'transfer_amount': amount,
        'transfer_remark': desc,
        'notify_url': getattr(settings, 'WECHAT_TRANSFER_NOTIFY_URL', ''),
    }

    try:
        status, resp = _v3_request(
            method='POST',
            url_path='/v3/fund-app/mch-transfer/transfer-bills',
            body_dict=body,
        )

        if status == 200:
            logger.warning(f"[WXPAY] Transfer SUCCESS: {resp}")
            return {
                'code': 'SUCCESS',
                'state': resp.get('state'),
                'package_info': resp.get('package_info'),
                'transfer_bill_no': resp.get('transfer_bill_no'),
                'out_bill_no': out_bill_no,
            }
        else:
            err_code = resp.get('code', str(status))
            err_msg = resp.get('message', resp.get('detail', str(resp)))
            logger.warning(f"[WXPAY] Transfer FAIL status={status} resp={resp}")
            return {
                'code': 'FAIL',
                'error_code': err_code,
                'error_message': err_msg,
            }
    except Exception as e:
        logger.error(f"[WXPAY] Transfer Exception: {e}")
        return {'code': 'FAIL', 'error_code': 'EXCEPTION', 'error_message': str(e)}


def wxpay_query_transfer(out_bill_no: str) -> dict:
    """
    查询转账单详情
    https://pay.weixin.qq.com/doc/v3/merchant/4012716437
    """
    import logging
    logger = logging.getLogger('django.request')
    
    url_path = f'/v3/fund-app/mch-transfer/transfer-bills/out-bill-no/{out_bill_no}'
    
    try:
        status, resp = _v3_request(
            method='GET',
            url_path=url_path,
        )
        
        if status == 200:
            return {'code': 'SUCCESS', **resp}
        else:
            return {
                'code': 'FAIL',
                'error_code': resp.get('code', str(status)),
                'error_message': resp.get('message', str(resp)),
            }
    except Exception as e:
        return {'code': 'FAIL', 'error_message': str(e)}


def wxpay_cancel_transfer(out_bill_no: str) -> dict:
    """
    撤销转账单
    https://pay.weixin.qq.com/doc/v3/merchant/4012716458
    """
    import logging
    logger = logging.getLogger('django.request')
    
    url_path = f'/v3/fund-app/mch-transfer/transfer-bills/out-bill-no/{out_bill_no}/cancel'
    
    try:
        status, resp = _v3_request(
            method='POST',
            url_path=url_path,
            body_dict={},
        )
        
        if status == 200:
            return {'code': 'SUCCESS', **resp}
        else:
            return {
                'code': 'FAIL',
                'error_code': resp.get('code', str(status)),
                'error_message': resp.get('message', str(resp)),
            }
    except Exception as e:
        return {'code': 'FAIL', 'error_message': str(e)}
