<template>
  <fs-page>
    <fs-crud ref="crudRef" v-bind="crudBinding" />

    <!-- 审核弹窗 -->
    <el-dialog v-model="auditDialogVisible" title="审核打手申请" width="600px" destroy-on-close>
      <el-descriptions :column="2" border v-if="currentRow">
        <el-descriptions-item label="头像">
          <el-avatar :src="currentRow.avatar_url" :size="50" />
        </el-descriptions-item>
        <el-descriptions-item label="微信昵称">{{ currentRow.nickname }}</el-descriptions-item>
        <el-descriptions-item label="手机号">{{ currentRow.phone }}</el-descriptions-item>
        <el-descriptions-item label="真实姓名">{{ currentRow.real_name }}</el-descriptions-item>
        <el-descriptions-item label="身份证号" :span="2">{{ currentRow.id_card }}</el-descriptions-item>
        <el-descriptions-item label="身份证正面" :span="2">
          <el-image
            v-if="currentRow.id_card_front"
            :src="currentRow.id_card_front"
            :preview-src-list="[currentRow.id_card_front]"
            fit="contain"
            style="width: 200px; height: 120px"
          />
          <span v-else>-</span>
        </el-descriptions-item>
        <el-descriptions-item label="身份证反面" :span="2">
          <el-image
            v-if="currentRow.id_card_back"
            :src="currentRow.id_card_back"
            :preview-src-list="[currentRow.id_card_back]"
            fit="contain"
            style="width: 200px; height: 120px"
          />
          <span v-else>-</span>
        </el-descriptions-item>
        <el-descriptions-item label="申请时间">{{ currentRow.apply_time }}</el-descriptions-item>
        <el-descriptions-item label="注册时间">{{ currentRow.create_datetime }}</el-descriptions-item>
      </el-descriptions>

      <el-divider />

      <el-form :model="auditForm" label-width="80px">
        <el-form-item label="审核备注">
          <el-input
            v-model="auditForm.reason"
            type="textarea"
            :rows="3"
            placeholder="请输入审核备注（可选）"
          />
        </el-form-item>
      </el-form>

      <template #footer>
        <el-button @click="auditDialogVisible = false">取消</el-button>
        <el-button type="success" @click="handleApprove" :loading="auditLoading">通过</el-button>
        <el-button type="danger" @click="handleReject" :loading="auditLoading">驳回</el-button>
      </template>
    </el-dialog>
  </fs-page>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue';
import { useFs } from '@fast-crud/fast-crud';
import createCrudOptions from './crud';
import * as api from './api';
import { successMessage } from '/@/utils/message';

// 审核弹窗相关
const auditDialogVisible = ref(false);
const auditLoading = ref(false);
const currentRow = ref<any>(null);
const auditForm = ref({
    reason: '',
});

const openAuditDialog = (row: any) => {
    currentRow.value = row;
    auditForm.value.reason = '';
    auditDialogVisible.value = true;

    // 调用详情接口获取完整的身份证信息
    api.GetObj(row.id).then((res: any) => {
        currentRow.value = res.data;
    });
};

const handleApprove = () => {
    if (!currentRow.value) return;
    auditLoading.value = true;
    api.ApproveHunter(currentRow.value.id).then((res: any) => {
        successMessage(res.msg || '已通过审核');
        auditDialogVisible.value = false;
        crudExpose.doRefresh();
    }).finally(() => {
        auditLoading.value = false;
    });
};

const handleReject = () => {
    if (!currentRow.value) return;
    auditLoading.value = true;
    api.RejectHunter(currentRow.value.id, auditForm.value.reason || '资料审核不通过').then((res: any) => {
        successMessage(res.msg || '已驳回申请');
        auditDialogVisible.value = false;
        crudExpose.doRefresh();
    }).finally(() => {
        auditLoading.value = false;
    });
};

// 将方法通过 context 传递给 crud.tsx
const context: any = {
    openAuditDialog,
};

// 初始化 crud
const { crudRef, crudBinding, crudExpose } = useFs({ createCrudOptions, context });

onMounted(() => {
    crudExpose.doRefresh();
});
</script>
