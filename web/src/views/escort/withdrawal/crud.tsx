import * as api from './api';
import {
    AddReq,
    DelReq,
    EditReq,
    CreateCrudOptionsProps,
    CreateCrudOptionsRet,
    dict
} from '@fast-crud/fast-crud';

export const createCrudOptions = function ({ crudExpose }: CreateCrudOptionsProps): CreateCrudOptionsRet {
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
                hunter: {
                    title: '打手',
                    type: 'number',
                    column: {
                        width: 120,
                    },
                    search: { show: true },
                },
                amount: {
                    title: '提现金额(元)',
                    type: 'number',
                    column: {
                        minWidth: 120,
                    },
                },
                tax_amount: {
                    title: '个税金额(元)',
                    type: 'number',
                    column: {
                        minWidth: 120,
                    },
                    form: { show: false },
                },
                actual_amount: {
                    title: '实际到账(元)',
                    type: 'number',
                    column: {
                        minWidth: 120,
                    },
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
                    column: {
                        width: 120,
                    },
                    search: { show: true },
                },
                create_datetime: {
                    title: '申请时间',
                    type: 'datetime',
                    column: {
                        width: 180,
                    },
                    form: { show: false },
                },
                update_datetime: {
                    title: '处理时间',
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
