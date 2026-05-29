import * as api from './api';
import {
    AddReq,
    DelReq,
    EditReq,
    CreateCrudOptionsProps,
    CreateCrudOptionsRet,
    dict,
} from '@fast-crud/fast-crud';

/** 图片回显前缀，写死后端地址，避免 getBaseURL 拼接出错 */
export const IMAGE_BASE_URL = import.meta.env.VITE_MEDIA_URL;

/** 编辑回显时，给相对路径拼上完整前缀 */
function joinImageUrl(path: string): string {
    const p = String(path).replace(/\\/g, '/').replace(/^\/+/, '');
    if (/^https?:\/\//i.test(p)) return p;
    return `${IMAGE_BASE_URL}/${p}`;
}

/** 列表/表单组件 buildUrl：已是完整 URL 不再重复拼接 */
function buildImageDisplayUrl(value: any): string {
    if (value == null || value === '') return value;
    const raw =
        typeof value === 'object' && value !== null && 'image' in value
            ? String((value as { image: string }).image)
            : String(value);
    return joinImageUrl(raw);
}

/** 提交前把完整 URL 剥回相对路径（去掉前缀） */
function toStoredImagePath(s: string): string {
    const v = String(s).replace(/\\/g, '/').trim();
    if (!v) return '';
    const prefix = IMAGE_BASE_URL.replace(/\/+$/, '');
    if (v.startsWith(prefix)) {
        return v.slice(prefix.length).replace(/^\/+/, '');
    }
    return v;
}

export const createCrudOptions = function ({ crudExpose }: CreateCrudOptionsProps): CreateCrudOptionsRet {
    const pageRequest = async (query: any) => {
        return await api.GetList(query);
    };
    const editRequest = async ({ form, row }: EditReq) => {
        form.id = row.id;
        // 图片单独提交
        if (form.images) {
            await api.SaveImages({ service: row.id, images: form.images });
        }
        return await api.UpdateObj(form);
    };
    const delRequest = async ({ row }: DelReq) => {
        return await api.DelObj(row.id);
    };
    const addRequest = async ({ form }: AddReq) => {
        // 先创建商品，再保存图片
        const res = await api.AddObj(form);
        // 确保 res.data 存在且包含 id
        if (res?.data?.id && form.images && form.images.length > 0) {
            await api.SaveImages({ service: res.data.id, images: form.images });
        }
        return res;
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
                    column: { show: false },
                    form: { show: false },
                },
                name: {
                    title: '商品名称',
                    type: 'text',
                    column: {
                        minWidth: 150,
                    },
                    search: { show: true },
                    form: {
                        rules: [{ required: true, message: '请输入商品名称' }],
                        component: {
                            placeholder: '例如：钻石段位代练',
                        },
                    },
                },
                category: {
                    title: '所属游戏',
                    type: 'dict-select',
                    dict: dict({
                        url: '/api/escort/web/service_category/',
                        async: false,
                        label: 'name',
                        value: 'id',
                        props: {
                            label: 'name',
                            value: 'id',
                        },
                        query: { is_active: true },
                    }),
                    column: {
                        width: 120,
                    },
                    search: { show: true },
                    form: {
                        rules: [{ required: true, message: '请选择所属游戏' }],
                        component: {
                            placeholder: '请选择所属游戏',
                        },
                    },
                },
                service_type: {
                    title: '服务类型',
                    type: 'dict-select',
                    dict: dict({
                        data: [
                            { value: 1, label: '代练', color: 'success' },
                            { value: 2, label: '陪玩', color: 'primary' },
                        ],
                    }),
                    column: {
                        width: 100,
                    },
                    search: { show: true },
                    form: {
                        rules: [{ required: true, message: '请选择服务类型' }],
                        value: 1,
                        component: {
                            placeholder: '请选择服务类型',
                        },
                    },
                },
                required_hunters: {
                    title: '所需人数',
                    type: 'number',
                    column: {
                        width: 100,
                    },
                    form: {
                        value: 1,
                        component: {
                            placeholder: '需要多少打手',
                        },
                    },
                },
                price: {
                    title: '价格(元)',
                    type: 'number',
                    column: {
                        minWidth: 100,
                    },
                    form: {
                        rules: [{ required: true, message: '请输入价格' }],
                        component: {
                            placeholder: '商品价格',
                        },
                    },
                },
                duration: {
                    title: '时长(分钟)',
                    type: 'number',
                    column: {
                        width: 110,
                    },
                    form: {
                        rules: [{ required: true, message: '请输入服务时长' }],
                        component: {
                            placeholder: '预计服务时长(分钟)',
                        },
                    },
                },
                // 段位/模式：隐藏，不在后台管理展示
                game_mode: {
                    title: '段位/模式',
                    column: { show: false },
                    form: {
                        show: false,
                    },
                },
                sort: {
                    title: '排序',
                    type: 'number',
                    column: {
                        width: 80,
                    },
                    form: {
                        value: 0,
                        component: {
                            placeholder: '数值越小越靠前',
                        },
                    },
                },
                images: {
                    title: '商品图片',
                    // 与游戏分类同属 fs-file-uploader；勿在 component 上写 name: 'file'，会覆盖 Vue 组件名 fs-file-uploader 导致上传区不渲染
                    type: 'image-uploader',
                    column: {
                        minWidth: 100,
                        component: {
                            name: 'fs-images-format',
                            buildUrl(value: any) {
                                return buildImageDisplayUrl(value);
                            },
                        },
                    },
                    form: {
                        col: { span: 24 },
                        component: {
                            limit: 5,
                            /** 回显：相对路径拼接写死的后端地址 */
                            buildUrl(path: string) {
                                return buildImageDisplayUrl(path);
                            },
                        },
                    },
                    valueBuilder(context: { row: any; key: string }) {
                        // 直接返回完整 URL，fs-file-uploader 的 img src 就直接是可访问的地址
                        if (context.row?.images) {
                            return context.row.images.map((img: any) => {
                                const p = img.image ?? img;
                                return typeof p === 'string' ? joinImageUrl(p) : joinImageUrl(String(p));
                            });
                        }
                        return [];
                    },
                    valueResolve({ form }: { form: any }) {
                        // 提交前把完整 URL 剥成相对路径传给后端
                        const v = form.images;
                        if (!Array.isArray(v)) return;
                        form.images = v
                            .map((item: any) =>
                                toStoredImagePath(
                                    typeof item === 'string' ? item : item.url ?? item.path ?? ''
                                )
                            )
                            .filter(Boolean);
                    },
                },
                is_active: {
                    title: '是否上架',
                    type: 'dict-select',
                    dict: dict({
                        data: [
                            { value: true, label: '上架', color: 'success' },
                            { value: false, label: '下架', color: 'danger' },
                        ],
                    }),
                    column: {
                        width: 100,
                    },
                    search: { show: true },
                    form: {
                        value: true,
                    },
                },
                description: {
                    title: '商品描述',
                    type: ['editor-wang5', 'colspan'],
                    column: {
                        minWidth: 200,
                        show: false,
                    },
                    form: {
                        col: { span: 24 },
                        component: {
                            id: 'escort-service-description',
                            placeholder: '请输入商品详细描述，支持富文本格式',
                            uploader: {
                                type: 'form',
                                buildUrl(res: any) {
                                    return res.url;
                                },
                            },
                        },
                    },
                },
                create_datetime: {
                    title: '创建时间',
                    type: 'datetime',
                    column: {
                        width: 180,
                        show: false,
                    },
                    form: { show: false },
                },
            },
        },
    };
};
