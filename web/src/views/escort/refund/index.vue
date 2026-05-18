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

        <fs-crud ref="crudRef" v-bind="crudBinding" />

        <!-- 审核弹窗 -->
        <el-dialog
            v-model="auditDialogVisible"
            title="退款审核"
            width="600px"
            :close-on-click-modal="false"
            destroy-on-close
        >
            <div v-if="auditRow" class="audit-dialog">
                <!-- 订单信息区域 -->
                <div class="info-section">
                    <div class="section-title">订单信息</div>
                    <el-descriptions :column="2" border size="small">
                        <el-descriptions-item label="订单编号">{{ auditRow.order_no }}</el-descriptions-item>
                        <el-descriptions-item label="服务项目">{{ auditRow.service_name }}</el-descriptions-item>
                        <el-descriptions-item label="客户昵称">{{ auditRow.customer_nickname }}</el-descriptions-item>
                        <el-descriptions-item label="客户电话">{{ auditRow.customer_phone || '-' }}</el-descriptions-item>
                        <el-descriptions-item label="订单金额">
                            <span style="color: #FF3366; font-weight: 600;">¥{{ auditRow.total_amount }}</span>
                        </el-descriptions-item>
                        <el-descriptions-item label="申请退款">
                            <span style="color: #FF3366; font-weight: 600;">¥{{ auditRow.refund_amount }}</span>
                        </el-descriptions-item>
                    </el-descriptions>
                </div>

                <!-- 退款原因区域 -->
                <div class="info-section">
                    <div class="section-title">退款原因</div>
                    <el-descriptions :column="1" border size="small">
                        <el-descriptions-item label="原因类型">
                            <el-tag size="small">{{ auditRow.reason_type_display }}</el-tag>
                        </el-descriptions-item>
                        <el-descriptions-item label="详细说明">
                            <span style="color: #F56C6C;">{{ auditRow.reason_detail || '无' }}</span>
                        </el-descriptions-item>
                        <el-descriptions-item label="申请时间">
                            {{ formatTime(auditRow.create_datetime) }}
                        </el-descriptions-item>
                    </el-descriptions>
                </div>

                <!-- 审核操作区域 -->
                <div class="info-section">
                    <div class="section-title">审核备注</div>
                    <el-input
                        v-model="reviewNotes"
                        type="textarea"
                        :rows="3"
                        placeholder="请输入审核备注（选填）"
                        style="width: 100%;"
                    />
                </div>
            </div>

            <template #footer>
                <div v-if="auditRow && (auditRow.status === 0 || auditRow.status === 5)">
                    <el-button @click="auditDialogVisible = false" :disabled="auditLoading">取消</el-button>
                    <el-button type="danger" :loading="auditLoading" @click="handleReject">
                        驳回
                    </el-button>
                    <el-button type="success" :loading="auditLoading" @click="handleApprove">
                        {{ auditRow.status === 5 ? '重新通过' : '通过' }}
                    </el-button>
                </div>
                <div v-else>
                    <el-button @click="auditDialogVisible = false">关闭</el-button>
                </div>
            </template>
        </el-dialog>
    </fs-page>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue';
import { useExpose, useCrud } from '@fast-crud/fast-crud';
import { ElMessage } from 'element-plus';
import { ApproveRefund, RejectRefund, ExecuteRefund } from './api';
import { request } from '/@/utils/service';
import { dict } from '@fast-crud/fast-crud';

// crud组件ref
const crudRef = ref();
const crudBinding = ref();

// 暴露的方法
const { crudExpose } = useExpose({ crudRef, crudBinding });

// ========== 审核弹窗相关 ==========
const auditDialogVisible = ref(false);
const auditRow = ref<any>(null);
const auditLoading = ref(false);
const reviewNotes = ref('');

const resetAuditDialog = () => {
    auditRow.value = null;
    auditLoading.value = false;
    reviewNotes.value = '';
};

const openAuditDialog = (row: any) => {
    resetAuditDialog();
    auditRow.value = row;
    auditDialogVisible.value = true;
};

// 通过审核，并自动执行退款
const handleApprove = async () => {
    auditLoading.value = true;
    try {
        await ApproveRefund(auditRow.value.id, { review_notes: reviewNotes.value });
        ElMessage.success('退款已通过');
        auditDialogVisible.value = false;
        // 自动执行退款
        await ExecuteRefund(auditRow.value.id);
        ElMessage.success('退款执行成功');
        crudExpose.doRefresh();
    } catch (e: any) {
        ElMessage.error(e.message || '操作失败');
        crudExpose.doRefresh();
    } finally {
        auditLoading.value = false;
    }
};

// 驳回审核
const handleReject = async () => {
    if (!reviewNotes.value.trim()) {
        ElMessage.warning('请填写驳回原因');
        return;
    }
    auditLoading.value = true;
    try {
        await RejectRefund(auditRow.value.id, { review_notes: reviewNotes.value });
        ElMessage.success('退款申请已驳回');
        auditDialogVisible.value = false;
        crudExpose.doRefresh();
    } catch (e: any) {
        ElMessage.error(e.message || '操作失败');
    } finally {
        auditLoading.value = false;
    }
};

// ========== 原有操作 ==========

// 格式化时间
const formatTime = (time: string) => {
    if (!time) return '-';
    return time.replace('T', ' ').slice(0, 19);
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
        width: 280,
        buttons: {
            view: { show: false },
            edit: { show: false },
            remove: { show: false },
            audit: {
                text: '审核',
                iconRight: 'View',
                type: 'text',
                visible: (ctx: any) => ctx.row.status === 0 || ctx.row.status === 5,
                click: (ctx: any) => {
                    if (context?.openAuditDialog) {
                        context.openAuditDialog(ctx.row);
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

// context 供 crud rowHandle buttons 回调使用
const context: any = {
    openAuditDialog,
};

// 初始化crud配置
const { resetCrudOptions } = useCrud({ crudExpose, crudOptions, context });

// 页面加载完成后执行
onMounted(() => {
    crudExpose.doRefresh();
});

// 导出刷新方法
defineExpose({
    doRefresh: () => crudExpose.doRefresh(),
});
</script>

<style scoped>
/* 审核弹窗样式 */
.audit-dialog {
    max-height: 60vh;
    overflow-y: auto;
}
.info-section {
    margin-bottom: 20px;
}
.info-section:last-child {
    margin-bottom: 0;
}
.section-title {
    font-size: 14px;
    font-weight: 600;
    color: #303133;
    margin-bottom: 10px;
    padding-left: 8px;
    border-left: 3px solid #00B4D8;
}
.section-title {
    font-size: 14px;
    font-weight: 600;
    color: #303133;
    margin-bottom: 10px;
    padding-left: 8px;
    border-left: 3px solid #00B4D8;
}
</style>
