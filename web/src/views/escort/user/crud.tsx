import * as api from './api';
import {
    AddReq,
    DelReq,
    EditReq,
    CreateCrudOptionsProps,
    CreateCrudOptionsRet,
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
                openid: {
                    title: '微信OpenID',
                    type: 'text',
                    column: {
                        minWidth: 160,
                    },
                    search: { show: true },
                },
                nickname: {
                    title: '昵称',
                    type: 'text',
                    column: {
                        minWidth: 100,
                    },
                    search: { show: true },
                },
                avatar_url: {
                    title: '头像',
                    type: 'image',
                    column: {
                        width: 80,
                        component: {
                            name: 'fs-images-format',
                        },
                    },
                    form: { show: false },
                },
                phone: {
                    title: '手机号',
                    type: 'text',
                    column: {
                        minWidth: 120,
                    },
                },
                real_name: {
                    title: '真实姓名',
                    type: 'text',
                    column: {
                        minWidth: 100,
                    },
                },
                id_card: {
                    title: '身份证号',
                    type: 'text',
                    column: {
                        minWidth: 180,
                    },
                },
                create_datetime: {
                    title: '注册时间',
                    type: 'datetime',
                    column: {
                        width: 180,
                    },
                    form: { show: false },
                },
                update_datetime: {
                    title: '更新时间',
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
