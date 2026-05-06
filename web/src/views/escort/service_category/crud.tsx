import * as api from './api';
import {
    AddReq,
    DelReq,
    EditReq,
    CreateCrudOptionsProps,
    CreateCrudOptionsRet,
    dict
} from '@fast-crud/fast-crud';

/** 图片回显前缀，写死后端地址 */
const IMAGE_BASE_URL = 'http://127.0.0.1:18088';

/** 已是完整 URL 不再重复拼接 */
function joinImageUrl(path: string): string {
    const p = String(path).replace(/\\/g, '/').replace(/^\/+/, '');
    if (/^https?:\/\//i.test(p)) return p;
    return `${IMAGE_BASE_URL}/${p}`;
}

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
            form: {
                col: { span: 24 },
                labelWidth: '120px',
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
                name: {
                    title: '游戏名称',
                    type: 'text',
                    column: {
                        minWidth: 120,
                    },
                    search: { show: true },
                    form: {
                        rules: [{ required: true, message: '请输入游戏名称' }],
                        component: {
                            placeholder: '例如：三角洲行动',
                        },
                    },
                },
                image: {
                    title: '图标',
                    type: 'avatar-uploader',
                    column: {
                        minWidth: 100,
                        component: {
                            name: 'fs-images-format',
                            buildUrl(value: any) {
                                if (!value) return value;
                                return joinImageUrl(typeof value === 'string' ? value : String(value));
                            },
                        },
                    },
                    form: {
                        component: {
                            buildUrl(path: string) {
                                return joinImageUrl(path);
                            },
                        },
                    },
                    valueBuilder(context: { row: any; key: string }) {
                        // 直接返回完整 URL，avatar-uploader 的 img src 直接就是可访问的地址
                        return joinImageUrl(context.row.image ?? context.row[context.key] ?? '');
                    },
                    valueResolve({ form }: { form: any }) {
                        // 提交前把完整 URL 剥成相对路径
                        const v = form.image;
                        if (!v) return;
                        const s = String(v).replace(/\\/g, '/').trim();
                        const prefix = IMAGE_BASE_URL.replace(/\/+$/, '');
                        if (s.startsWith(prefix)) {
                            form.image = s.slice(prefix.length).replace(/^\/+/, '');
                        }
                    },
                },
                description: {
                    title: '描述',
                    type: 'text',
                    column: {
                        minWidth: 200,
                    },
                    form: {
                        component: {
                            placeholder: '游戏描述（选填）',
                        },
                    },
                },
                sort: {
                    title: '排序',
                    type: 'number',
                    column: {
                        width: 100,
                    },
                    form: {
                        value: 0,
                        component: {
                            placeholder: '数值越小越靠前',
                        },
                    },
                },
                is_active: {
                    title: '是否启用',
                    type: 'dict-select',
                    dict: dict({
                        data: [
                            { value: true, label: '启用', color: 'success' },
                            { value: false, label: '禁用', color: 'danger' },
                        ],
                    }),
                    column: {
                        width: 120,
                    },
                    search: { show: true },
                },
            },
        },
    };
};
