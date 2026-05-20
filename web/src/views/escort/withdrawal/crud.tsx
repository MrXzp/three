import * as api from './api';
import { request } from '/@/utils/service';
import {
    AddReq,
    DelReq,
    EditReq,
    CreateCrudOptionsProps,
    CreateCrudOptionsRet,
    dict,
} from '@fast-crud/fast-crud';

export const createCrudOptions = function ({
    crudExpose,
    context,
}: CreateCrudOptionsProps): CreateCrudOptionsRet {
    const pageRequest = async (query: any) => {
        return await api.GetList(query);
    };
    const editRequest = async ({ form, row }: EditReq) => {
        form.id = row.id;
        return await api.UpdateObj(form);
    };
    const delRequest = async ({ row }: DelReq) => {
        return await api.DelObj(row.id);
    };
    const addRequest = async ({ form }: AddReq) => {
        return await api.AddObj(form);
    };

    return {
        crudOptions: {
            request: {
                pageRequest,
                addRequest,
                editRequest,
                delRequest,
            },
            actionbar: {
                buttons: {
                    add: { show: false },
                },
            },
            toolbar: {
                buttons: {
                    search: { show: true },
                    reload: { show: true },
                },
            },
            rowHandle: {
                fixed: 'right',
                width: 180,
                buttons: {
                    view: { show: false },
                    edit: { show: false },
                    remove: { show: false },
                    audit: {
                        text: '审核',
                        iconRight: 'View',
                        type: 'text',
                        visible: (ctx: any) => ctx.row.status === 0,
                        click: (ctx: any) => {
                            if (context?.openAuditDialog) {
                                context.openAuditDialog(ctx.row);
                            }
                        },
                    },
                    retryPay: {
                        text: '重试打款',
                        iconRight: 'Refresh',
                        type: 'text',
                        visible: (ctx: any) => ctx.row.status === 1,
                        click: (ctx: any) => {
                            if (context?.openAuditDialog) {
                                context.openAuditDialog(ctx.row, true);
                            }
                        },
                    },
                },
            },
            columns: {
                _index: {
                    title: '序号',
                    form: { show: false },
                    column: {
                        type: 'index',
                        align: 'center',
                        width: '70px',
                    },
                },
                id: {
                    title: 'ID',
                    type: 'number',
                    column: { width: 80 },
                    form: { show: false },
                },
                user_nickname: {
                    title: '用户昵称',
                    type: 'text',
                    column: { width: 120 },
                    search: { show: true },
                },
                user_phone: {
                    title: '手机号',
                    type: 'text',
                    column: { width: 130 },
                },
                user_balance: {
                    title: '余额(元)',
                    type: 'number',
                    column: { width: 100 },
                    formatter: (row: any) => `¥${Number(row.user_balance || 0).toFixed(2)}`,
                    form: { show: false },
                },
                amount: {
                    title: '提现金额(元)',
                    type: 'number',
                    column: { minWidth: 120 },
                    formatter: (row: any) => `¥${Number(row.amount || 0).toFixed(2)}`,
                },
                tax_amount: {
                    title: '个税金额(元)',
                    type: 'number',
                    column: { minWidth: 120 },
                    formatter: (row: any) => `¥${Number(row.tax_amount || 0).toFixed(2)}`,
                    form: { show: false },
                },
                actual_amount: {
                    title: '实际到账(元)',
                    type: 'number',
                    column: { minWidth: 120 },
                    formatter: (row: any) => `¥${Number(row.actual_amount || 0).toFixed(2)}`,
                    form: { show: false },
                },
                status: {
                    title: '提现状态',
                    type: 'dict-select',
                    dict: dict({
                        data: [
                            { value: 0, label: '申请中', color: 'info' },
                            { value: 1, label: '处理中', color: 'warning' },
                            { value: 2, label: '成功', color: 'success' },
                            { value: 3, label: '失败', color: 'danger' },
                        ],
                    }),
                    column: { width: 120 },
                    search: { show: true },
                },
                payment_no: {
                    title: '商户单号',
                    type: 'text',
                    column: { minWidth: 180, show: false },
                    form: { show: false },
                },
                review_notes: {
                    title: '审核备注',
                    type: 'text',
                    column: { minWidth: 150, show: false },
                    form: { show: false },
                },
                create_datetime: {
                    title: '申请时间',
                    type: 'datetime',
                    column: { width: 180 },
                    form: { show: false },
                },
                update_datetime: {
                    title: '处理时间',
                    type: 'datetime',
                    column: { width: 180 },
                    form: { show: false },
                },
            },
        },
    };
};
