<template>
    <fs-page>
        <template #header>
            <el-alert
                title="退款管理说明"
                type="info"
                :closable="false"
                style="margin-bottom: 10px"
            >
                <template #default>
                    <p>待审核：可批准或拒绝退款申请 | 已通过：需执行退款操作 | 已拒绝/已完成/失败：仅供查看</p>
                </template>
            </el-alert>
        </template>

        <fs-crud ref="crudRef" v-bind="crudBinding">
            <template #status-action="{ row }">
                <div style="display: flex; gap: 4px; flex-wrap: wrap;">
                    <!-- 待审核状态：批准 / 拒绝 -->
                    <template v-if="row.status === 0">
                        <el-button
                            type="success"
                            size="small"
                            link
                            @click="handleApprove(row)"
                        >
                            批准
                        </el-button>
                        <el-button
                            type="danger"
                            size="small"
                            link
                            @click="handleReject(row)"
                        >
                            拒绝
                        </el-button>
                    </template>
                    <!-- 已通过状态：执行退款 -->
                    <template v-else-if="row.status === 1">
                        <el-button
                            type="warning"
                            size="small"
                            link
                            @click="handleExecuteRefund(row)"
                        >
                            执行退款
                        </el-button>
                    </template>
                    <!-- 已拒绝/已完成/失败：仅显示状态标签 -->
                    <template v-else>
                        <el-tag :type="getStatusTagType(row.status)" size="small">
                            {{ row.status_display }}
                        </el-tag>
                    </template>
                </div>
            </template>
        </fs-crud>
    </fs-page>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue';
import { useExpose, useCrud } from '@fast-crud/fast-crud';
import { ElMessage, ElMessageBox } from 'element-plus';
import { ApproveRefund, RejectRefund, ExecuteRefund } from './api';
import { request } from '/@/utils/service';
import { dict } from '@fast-crud/fast-crud';

// crud组件ref
const crudRef = ref();
const crudBinding = ref();

// 暴露的方法
const { crudExpose } = useExpose({ crudRef, crudBinding });

// 获取状态标签类型
const getStatusTagType = (status: number) => {
    const types: Record<number, string> = {
        0: 'warning',
        1: 'primary',
        2: 'danger',
        3: 'warning',
        4: 'success',
        5: 'danger',
    };
    return types[status] || 'info';
};

// 批准退款
const handleApprove = async (row: any) => {
    try {
        await ElMessageBox.confirm(
            `确定批准订单 ${row.order_no} 的退款申请吗？\n退款金额：¥${row.refund_amount}`,
            '批准退款',
            {
                confirmButtonText: '确定批准',
                cancelButtonText: '取消',
                type: 'info',
            }
        );
        await ApproveRefund(row.id, {});
        ElMessage.success('退款申请已批准，请执行退款操作');
        crudExpose.doRefresh();
    } catch (e: any) {
        if (e !== 'cancel') {
            ElMessage.error(e.message || '操作失败');
        }
    }
};

// 拒绝退款
const handleReject = async (row: any) => {
    try {
        const { value } = await ElMessageBox.prompt('请输入拒绝原因', '拒绝退款', {
            confirmButtonText: '确定拒绝',
            cancelButtonText: '取消',
            inputType: 'textarea',
        });
        if (!value) {
            ElMessage.warning('请填写拒绝原因');
            return;
        }
        await RejectRefund(row.id, { review_notes: value });
        ElMessage.success('退款申请已拒绝');
        crudExpose.doRefresh();
    } catch (e: any) {
        if (e !== 'cancel') {
            ElMessage.error(e.message || '操作失败');
        }
    }
};

// 执行退款
const handleExecuteRefund = async (row: any) => {
    try {
        await ElMessageBox.confirm(
            `确定要对订单 ${row.order_no} 执行退款吗？\n退款金额：¥${row.actual_refund_amount || row.refund_amount}`,
            '执行退款',
            {
                confirmButtonText: '确定退款',
                cancelButtonText: '取消',
                type: 'warning',
            }
        );
        await ExecuteRefund(row.id);
        ElMessage.success('退款执行成功');
        crudExpose.doRefresh();
    } catch (e: any) {
        if (e !== 'cancel') {
            ElMessage.error(e.message || '操作失败');
        }
    }
};

// crud配置
const crudOptions = {
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
        width: 200,
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
            column: { minWidth: 120 },
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
            column: { minWidth: 150 },
            form: { show: false },
        },
        status: {
            title: '状态',
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
            column: {
                width: 100,
                slot: true, // 启用自定义列插槽
            },
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
};

// 初始化crud配置
const { resetCrudOptions } = useCrud({ crudExpose, crudOptions });

// 页面加载完成后执行
onMounted(() => {
    crudExpose.doRefresh();
});

// 导出刷新方法
defineExpose({
    doRefresh: () => crudExpose.doRefresh(),
});
</script>
