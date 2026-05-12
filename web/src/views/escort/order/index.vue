<template>
  <fs-page>
    <fs-crud ref="crudRef" v-bind="crudBinding" />

    <!-- 沟通记录抽屉 -->
    <OrderChatDrawer
        ref="chatDrawerRef"
        :orderId="currentOrderId"
        :myUserId="null"
        myNickname="管理员"
        myAvatar=""
    />
  </fs-page>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue';
import { useExpose, useCrud } from '@fast-crud/fast-crud';
import { createCrudOptions } from './crud';
import * as api from './api';
import OrderChatDrawer from './chat-drawer.vue';

// crud组件ref
const crudRef = ref();
const crudBinding = ref();
const chatDrawerRef = ref<InstanceType<typeof OrderChatDrawer> | null>(null);
const currentOrderId = ref<number | string | null>(null);

// 暴露的方法
const { crudExpose } = useExpose({ crudRef, crudBinding });

// 打开聊天抽屉
const openChatDrawer = (row: any) => {
    currentOrderId.value = row.id;
    chatDrawerRef.value?.open(row.id);
};

// 你的crud配置
const context: any = {
    openChatDrawer,
};
const { crudOptions } = createCrudOptions({ context, crudExpose });
// 初始化crud配置
const { resetCrudOptions } = useCrud({ crudExpose, crudOptions });

// 页面加载完成后执行
onMounted(() => {
    crudExpose.doRefresh();
});
</script>
