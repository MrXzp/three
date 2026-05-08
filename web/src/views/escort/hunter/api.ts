import { request } from '/@/utils/service';
import { PageQuery, AddReq, DelReq, EditReq, InfoReq } from '@fast-crud/fast-crud';

export const apiPrefix = '/api/escort/web/hunter/';

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

/** 批准打手申请 */
export function ApproveHunter(id: number) {
    return request({
        url: apiPrefix + id + '/approve_hunter/',
        method: 'post',
    });
}

/** 拒绝打手申请 */
export function RejectHunter(id: number, reason?: string) {
    return request({
        url: apiPrefix + id + '/reject_hunter/',
        method: 'post',
        data: reason ? { reject_reason: reason } : {},
    });
}

/** 暂停打手 */
export function SuspendHunter(id: number) {
    return request({
        url: apiPrefix + id + '/suspend/',
        method: 'post',
    });
}

/** 激活打手 */
export function ActivateHunter(id: number) {
    return request({
        url: apiPrefix + id + '/activate/',
        method: 'post',
    });
}

/** 撤销打手身份 */
export function RevokeHunter(id: number) {
    return request({
        url: apiPrefix + id + '/revoke/',
        method: 'post',
    });
}
