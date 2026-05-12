import { request } from '/@/utils/service';

const webApiPrefix = '/api/escort/web/order/';

export function GetChatMessages(orderId: number | string, params?: { after_id?: number; limit?: number }) {
    return request({
        url: `${webApiPrefix}${orderId}/messages/`,
        method: 'get',
        params,
    });
}

export function SendChatMessage(orderId: number | string, data: { content: string; message_type?: number }) {
    return request({
        url: `${webApiPrefix}${orderId}/messages/`,
        method: 'post',
        data,
    });
}
