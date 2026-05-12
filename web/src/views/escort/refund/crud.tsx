import { request } from '/@/utils/service';
import { ElMessage, ElMessageBox } from 'element-plus';
import {
    AddReq,
    CreateCrudOptionsProps,
    CreateCrudOptionsRet,
    dict,
} from '@fast-crud/fast-crud';
import { ApproveRefund, RejectRefund, ExecuteRefund } from './api';

export const createCrudOptions = function ({
    crudExpose,
    context,
}: CreateCrudOptionsProps): CreateCrudOptionsRet {
    return {
        crudOptions: {
            request: {
                pageRequest: async (query: any) => {
                    return await request({
                        url: '/api/escort/web/refund/',
                        method: 'get',
                        params: query,
                    });
                },
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
                width: 280,
                buttons: {
                    view: { show: false },
                    edit: { show: false },
                    remove: { show: false },
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
                order_no: {
                    title: '订单编号',
                    type: 'text',
                    column: { minWidth: 180 },
                    search: { show: true },
                },
                customer_nickname: {
                    title: '客户昵称',
                    type: 'text',
                    column: { width: 120 },
                    search: { show: true },
                },
                customer_phone: {
                    title: '客户电话',
                    type: 'text',
                    column: { width: 130 },
                },
                service_name: {
                    title: '服务项目',
                    type: 'text',
                    column: { width: 120 },
                },
                total_amount: {
                    title: '订单金额',
                    type: 'number',
                    column: { width: 100 },
                    formatter: (row: any) => `¥${row.total_amount}`,
                },
                refund_amount: {
                    title: '申请金额',
                    type: 'number',
                    column: { width: 100 },
                    formatter: (row: any) => `¥${row.refund_amount}`,
                },
                actual_refund_amount: {
                    title: '实退金额',
                    type: 'number',
                    column: { width: 100 },
                    formatter: (row: any) =>
                        row.actual_refund_amount ? `¥${row.actual_refund_amount}` : '-',
                },
                reason_type: {
                    title: '退款原因',
                    type: 'dict-select',
                    dict: dict({
                        data: [
                            { value: 'user_cancel', label: '用户取消', color: 'info' },
                            { value: 'service_issue', label: '服务问题', color: 'warning' },
                            { value: 'other', label: '其他原因', color: 'default' },
                        ],
                    }),
                    column: { width: 100 },
                },
                reason_detail: {
                    title: '详细说明',
                    type: 'text',
                    column: { minWidth: 150, show: false },
                    form: { show: false },
                },
                status: {
                    title: '退款状态',
                    type: 'dict-select',
                    dict: dict({
                        data: [
                            { value: 0, label: '待审核', color: 'warning' },
                            { value: 1, label: '已通过', color: 'primary' },
                            { value: 2, label: '已拒绝', color: 'danger' },
                            { value: 3, label: '退款中', color: 'warning' },
                            { value: 4, label: '已完成', color: 'success' },
                            { value: 5, label: '失败', color: 'danger' },
                        ],
                    }),
                    column: { width: 100 },
                    search: { show: true },
                },
                refund_no: {
                    title: '退款单号',
                    type: 'text',
                    column: { minWidth: 180, show: false },
                    form: { show: false },
                },
                reviewer_name: {
                    title: '审核人',
                    type: 'text',
                    column: { width: 100 },
                    form: { show: false },
                },
                review_notes: {
                    title: '审核备注',
                    type: 'text',
                    column: { minWidth: 150, show: false },
                    form: { show: false },
                },
                review_time: {
                    title: '审核时间',
                    type: 'datetime',
                    column: { width: 170 },
                    form: { show: false },
                },
                create_datetime: {
                    title: '申请时间',
                    type: 'datetime',
                    column: { width: 170 },
                    form: { show: false },
                },
                refund_time: {
                    title: '退款时间',
                    type: 'datetime',
                    column: { width: 170 },
                    form: { show: false },
                },
            },
        },
    };
};
