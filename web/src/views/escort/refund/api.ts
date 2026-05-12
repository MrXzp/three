import { request } from '/@/utils/service';
import { PageQuery, AddReq, DelReq, EditReq, InfoReq } from '@fast-crud/fast-crud';

export const apiPrefix = '/api/escort/web/refund/';

export function GetList(query: PageQuery) {
    return request({
        url: apiPrefix,
        method: 'get',
        params: query,
    });
}

export function GetObj(id: InfoReq) {
    return request({
        url: apiPrefix + id + '/',
        method: 'get',
    });
}

export function AddObj(obj: AddReq) {
    return request({
        url: apiPrefix,
        method: 'post',
        data: obj,
    });
}

export function UpdateObj(obj: EditReq) {
    return request({
        url: apiPrefix + obj.id + '/',
        method: 'put',
        data: obj,
    });
}

export function DelObj(id: DelReq) {
    return request({
        url: apiPrefix + id + '/',
        method: 'delete',
        data: { id },
    });
}

/**
 * 批准退款申请
 */
export function ApproveRefund(id: number, data: any) {
    return request({
        url: apiPrefix + id + '/approve/',
        method: 'post',
        data,
    });
}

/**
 * 拒绝退款申请
 */
export function RejectRefund(id: number, data: any) {
    return request({
        url: apiPrefix + id + '/reject/',
        method: 'post',
        data,
    });
}

/**
 * 执行退款
 */
export function ExecuteRefund(id: number, data?: any) {
    return request({
        url: apiPrefix + id + '/execute_refund/',
        method: 'post',
        data: data || {},
    });
}

/**
 * 查询退款状态
 */
export function QueryRefundStatus(id: number) {
    return request({
        url: apiPrefix + id + '/query_refund_status/',
        method: 'get',
    });
}
