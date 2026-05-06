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
                hunter_a: {
                    title: '打手A',
                    type: 'number',
                    column: {
                        width: 120,
                    },
                    search: { show: true },
                },
                hunter_b: {
                    title: '打手B',
                    type: 'number',
                    column: {
                        width: 120,
                    },
                    search: { show: true },
                },
                status: {
                    title: '状态',
                    type: 'dict-select',
                    dict: dict({
                        data: [
                            { value: 1, label: '活跃', color: 'success' },
                            { value: 2, label: '已删除', color: 'danger' },
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
