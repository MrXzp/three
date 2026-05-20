<template>
    <fs-page>
        <template #header>
            <el-alert
                title="提现管理说明"
                type="info"
                :closable="false"
                style="margin-bottom: 10px"
            >
                <template #default>
                    <p>申请中：可审核通过（自动打款）或驳回 | 处理中：微信正在转账中 | 成功/失败：仅供查看</p>
                </template>
            </el-alert>
        </template>

        <fs-crud ref="crudRef" v-bind="crudBinding" />

        <!-- 审核弹窗 -->
        <el-dialog
            v-model="auditDialogVisible"
            title="提现审核"
            width="600px"
            :close-on-click-modal="false"
            destroy-on-close
        >
            <div v-if="auditRow" class="audit-dialog">
                <!-- 用户信息区域 -->
                <div class="info-section">
                    <div class="section-title">用户信息</div>
                    <el-descriptions :column="2" border size="small">
                        <el-descriptions-item label="用户昵称">{{ auditRow.user_nickname || '-' }}</el-descriptions-item>
                        <el-descriptions-item label="联系方式">{{ auditRow.user_phone || '-' }}</el-descriptions-item>
                        <el-descriptions-item label="当前余额">
                            <span style="color: #67C23A; font-weight: 600;">¥{{ Number(auditRow.user_balance || 0).toFixed(2) }}</span>
                        </el-descriptions-item>
                        <el-descriptions-item label="申请时间">
                            {{ formatTime(auditRow.create_datetime) }}
                        </el-descriptions-item>
                    </el-descriptions>
                </div>

                <!-- 提现信息区域 -->
                <div class="info-section">
                    <div class="section-title">提现信息</div>
                    <el-descriptions :column="2" border size="small">
                        <el-descriptions-item label="提现金额">
                            <span style="color: #FF3366; font-weight: 600;">¥{{ Number(auditRow.amount || 0).toFixed(2) }}</span>
                        </el-descriptions-item>
                        <el-descriptions-item label="实际到账">
                            <span style="color: #FF3366; font-weight: 600;">¥{{ Number(auditRow.actual_amount || 0).toFixed(2) }}</span>
                        </el-descriptions-item>
                    </el-descriptions>
                </div>

                <!-- 审核备注区域 -->
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
                <div v-if="auditRow">
                    <!-- status=0：申请中，显示批准/驳回按钮 -->
                    <template v-if="auditRow.status === 0">
                        <el-button @click="auditDialogVisible = false" :disabled="auditLoading">取消</el-button>
                        <el-button type="danger" :loading="auditLoading" @click="handleReject">
                            驳回
                        </el-button>
                        <el-button type="success" :loading="auditLoading" @click="handleApprove">
                            通过并打款
                        </el-button>
                    </template>
                    <!-- status=1：处理中（重试），只显示重试打款按钮 -->
                    <template v-else-if="auditRow.status === 1">
                        <el-button @click="auditDialogVisible = false" :disabled="auditLoading">关闭</el-button>
                        <el-button type="warning" :loading="auditLoading" @click="handleRetryPay">
                            重试打款
                        </el-button>
                    </template>
                    <!-- 其他状态：只有关闭 -->
                    <template v-else>
                        <el-button @click="auditDialogVisible = false">关闭</el-button>
                    </template>
                </div>
            </template>
        </el-dialog>
    </fs-page>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue';
import { useExpose, useCrud } from '@fast-crud/fast-crud';
import { ElMessage } from 'element-plus';
import { ApproveWithdrawal, CompleteWithdrawal, RejectWithdrawal } from './api';
import { request } from '/@/utils/service';
import { dict } from '@fast-crud/fast-crud';
import { createCrudOptions } from './crud';

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

const openAuditDialog = (row: any, isRetry = false) => {
    resetAuditDialog();
    auditRow.value = row;
    auditRow.value._isRetry = isRetry;
    auditDialogVisible.value = true;
};

// 格式化时间
const formatTime = (time: string) => {
    if (!time) return '-';
    return time.replace('T', ' ').slice(0, 19);
};

// 通过审核 → 批准 + 调微信打款
const handleApprove = async () => {
    auditLoading.value = true;
    try {
        // 1. 批准（进入处理中）
        await ApproveWithdrawal(auditRow.value.id, { review_notes: reviewNotes.value });
        // 2. 直接调微信打款
        await CompleteWithdrawal(auditRow.value.id);
        ElMessage.success('已通过并提交微信转账请求');
        auditDialogVisible.value = false;
        crudExpose.doRefresh();
    } catch (e: any) {
        ElMessage.error(e?.message || '操作失败');
        crudExpose.doRefresh();
    } finally {
        auditLoading.value = false;
    }
};

// 重试微信打款（仅调 complete，不改状态）
const handleRetryPay = async () => {
    auditLoading.value = true;
    try {
        await CompleteWithdrawal(auditRow.value.id);
        ElMessage.success('已提交微信转账请求');
        auditDialogVisible.value = false;
        crudExpose.doRefresh();
    } catch (e: any) {
        ElMessage.error(e?.message || '操作失败');
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
        await RejectWithdrawal(auditRow.value.id, { review_notes: reviewNotes.value });
        ElMessage.success('提现申请已驳回');
        auditDialogVisible.value = false;
        crudExpose.doRefresh();
    } catch (e: any) {
        ElMessage.error(e?.message || '操作失败');
    } finally {
        auditLoading.value = false;
    }
};

// ========== crud 配置 ==========
const { crudOptions } = createCrudOptions({
    context: { openAuditDialog },
    crudExpose,
});

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
</style>
