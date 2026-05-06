import * as api from './api';
import {
    AddReq,
    DelReq,
    EditReq,
    CreateCrudOptionsProps,
    CreateCrudOptionsRet
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
                order: {
                    title: '订单',
                    type: 'number',
                    column: {
                        width: 120,
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
                rating: {
                    title: '评分',
                    type: 'number',
                    column: {
                        width: 100,
                    },
                },
                comment: {
                    title: '评价内容',
                    type: 'text',
                    column: {
                        minWidth: 200,
                    },
                },
                create_datetime: {
                    title: '评价时间',
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
