import { request } from '/@/utils/service';
import { PageQuery, AddReq, DelReq, EditReq, InfoReq } from '@fast-crud/fast-crud';

export const apiPrefix = '/api/escort/web/withdrawal/';

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
 * 批准提现申请（进入处理中）
 */
export function ApproveWithdrawal(id: number, data?: any) {
    return request({
        url: apiPrefix + id + '/approve/',
        method: 'post',
        data: data || {},
    });
}

/**
 * 确认打款（调用微信企业付款）
 */
export function CompleteWithdrawal(id: number, data?: any) {
    return request({
        url: apiPrefix + id + '/complete/',
        method: 'post',
        data: data || {},
    });
}

/**
 * 拒绝提现申请
 */
export function RejectWithdrawal(id: number, data: { review_notes: string }) {
    return request({
        url: apiPrefix + id + '/reject/',
        method: 'post',
        data,
    });
}
