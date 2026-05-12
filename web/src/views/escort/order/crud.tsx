import * as api from './api';
import {
    AddReq,
    DelReq,
    EditReq,
    CreateCrudOptionsProps,
    CreateCrudOptionsRet,
    dict
} from '@fast-crud/fast-crud';

export const createCrudOptions = function ({ crudExpose, context }: CreateCrudOptionsProps): CreateCrudOptionsRet {
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
            rowHandle: {
                fixed: 'right',
                width: 160,
                buttons: {
                    view: { show: false },
                    edit: { show: false },
                    remove: { show: false },
                    chat: {
                        text: '沟通记录',
                        iconRight: 'ChatDotRound',
                        type: 'text',
                        click: (ctx: any) => {
                            if (context?.openChatDrawer) {
                                context.openChatDrawer(ctx.row);
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
                    column: {
                        width: 80,
                    },
                    form: { show: false },
                },
                order_no: {
                    title: '订单号',
                    type: 'text',
                    column: {
                        minWidth: 200,
                    },
                    search: { show: true },
                },
                customer: {
                    title: '客户',
                    type: 'number',
                    column: {
                        width: 120,
                    },
                    search: { show: true },
                },
                service: {
                    title: '服务项目',
                    type: 'number',
                    column: {
                        width: 120,
                    },
                    search: { show: true },
                },
                total_amount: {
                    title: '总金额(元)',
                    type: 'number',
                    column: {
                        minWidth: 120,
                    },
                },
                status: {
                    title: '订单状态',
                    type: 'dict-select',
                    dict: dict({
                        data: [
                            { value: 0, label: '待支付', color: 'info' },
                            { value: 1, label: '待接单', color: 'warning' },
                            { value: 2, label: '已接单', color: 'primary' },
                            { value: 3, label: '等待搭子', color: 'warning' },
                            { value: 4, label: '服务中', color: 'processing' },
                            { value: 5, label: '待确认', color: 'warning' },
                            { value: 6, label: '已完成', color: 'success' },
                            { value: 7, label: '已评价', color: 'default' },
                            { value: 8, label: '已取消', color: 'danger' },
                        ],
                    }),
                    column: {
                        width: 120,
                    },
                    search: { show: true },
                },
                create_datetime: {
                    title: '创建时间',
                    type: 'datetime',
                    column: {
                        width: 180,
                    },
                    form: { show: false },
                },
            },
        },
    };
};
