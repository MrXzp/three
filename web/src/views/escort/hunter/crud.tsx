import {
    CreateCrudOptionsProps,
    CreateCrudOptionsRet,
    AddReq,
    DelReq,
    EditReq,
    dict,
} from '@fast-crud/fast-crud';
import * as api from './api';
import { successMessage } from '/@/utils/message';

export default function ({ crudExpose, context }: CreateCrudOptionsProps): CreateCrudOptionsRet {
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
            tabs: {
                show: true,
                name: 'hunter_status',
                options: [
                    { label: '待审核', value: 1 },
                    { label: '已通过', value: 2 },
                    { label: '已拒绝', value: 3 },
                    { label: '已暂停', value: 4 },
                    { label: '全部', value: 0 },
                ],
            },
            actionbar: {
                buttons: {
                    add: { show: false },
                },
            },
            rowHandle: {
                fixed: 'right',
                width: 120,
                buttons: {
                    view: { show: false },
                    edit: { show: false },
                    remove: { show: false },
                    audit: {
                        text: '审核',
                        iconRight: 'Document',
                        type: 'text',
                        show: (ctx: any) => ctx.row.hunter_status === 1,
                        click: (ctx: any) => {
                            context.openAuditDialog(ctx.row);
                        },
                    },
                    suspend: {
                        text: '暂停',
                        iconRight: 'Pause',
                        type: 'text',
                        show: (ctx: any) => ctx.row.hunter_status === 2,
                        click: (ctx: any) => {
                            api.SuspendHunter(ctx.row.id).then((res: any) => {
                                successMessage(res.msg);
                                crudExpose.doRefresh();
                            });
                        },
                    },
                    activate: {
                        text: '激活',
                        iconRight: 'VideoPlay',
                        type: 'text',
                        show: (ctx: any) => ctx.row.hunter_status === 4,
                        click: (ctx: any) => {
                            api.ActivateHunter(ctx.row.id).then((res: any) => {
                                successMessage(res.msg);
                                crudExpose.doRefresh();
                            });
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
                avatar_url: {
                    title: '头像',
                    type: 'avatar',
                    column: {
                        width: 80,
                        component: {
                            name: 'fs-images-format',
                        },
                    },
                    form: { show: false },
                },
                nickname: {
                    title: '微信昵称',
                    type: 'text',
                    column: { minWidth: 120 },
                    search: { show: true },
                },
                phone: {
                    title: '手机号',
                    type: 'text',
                    column: { minWidth: 130 },
                    search: { show: true },
                },
                real_name: {
                    title: '真实姓名',
                    type: 'text',
                    column: { minWidth: 100 },
                    search: { show: true },
                    form: { show: false },
                },
                id_card: {
                    title: '身份证号',
                    type: 'text',
                    column: { minWidth: 180 },
                    form: { show: false },
                },
                id_card_front: {
                    title: '身份证正面',
                    type: 'image',
                    column: { show: false },
                    form: { show: false },
                },
                id_card_back: {
                    title: '身份证反面',
                    type: 'image',
                    column: { show: false },
                    form: { show: false },
                },
                hunter_status: {
                    title: '状态',
                    type: 'dict-select',
                    dict: dict({
                        data: [
                            { value: 0, label: '未申请', color: 'info' },
                            { value: 1, label: '待审核', color: 'warning' },
                            { value: 2, label: '已通过', color: 'success' },
                            { value: 3, label: '已拒绝', color: 'danger' },
                            { value: 4, label: '已暂停', color: 'danger' },
                        ],
                    }),
                    column: { width: 120 },
                    search: { show: false },
                    form: { show: false },
                },
                apply_time: {
                    title: '申请时间',
                    type: 'datetime',
                    column: { width: 170 },
                    form: { show: false },
                },
                approve_time: {
                    title: '审核通过时间',
                    type: 'datetime',
                    column: { width: 170 },
                    form: { show: false },
                },
                balance: {
                    title: '余额(元)',
                    type: 'number',
                    column: { minWidth: 110 },
                    form: {
                        value: 0,
                        component: {
                            placeholder: '仅修改余额',
                        },
                    },
                },
                total_income: {
                    title: '总收入(元)',
                    type: 'number',
                    column: { minWidth: 120 },
                    form: { show: false },
                },
                total_withdrawal: {
                    title: '总提现(元)',
                    type: 'number',
                    column: { minWidth: 120 },
                    form: { show: false },
                },
                completed_orders: {
                    title: '完成订单数',
                    type: 'number',
                    column: { minWidth: 120 },
                    form: { show: false },
                },
                avg_rating: {
                    title: '平均评分',
                    type: 'number',
                    column: { minWidth: 110 },
                    form: { show: false },
                },
                create_datetime: {
                    title: '注册时间',
                    type: 'datetime',
                    column: { width: 170 },
                    form: { show: false },
                },
            },
        },
    };
};
