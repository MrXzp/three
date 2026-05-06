<template>
  <fs-page>
    <fs-crud ref="crudRef" v-bind="crudBinding" />
  </fs-page>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue';
import { useExpose, useCrud } from '@fast-crud/fast-crud';
import { createCrudOptions } from './crud';
import * as api from './api';

// crud组件ref
const crudRef = ref()
const crudBinding = ref()
// 暴露的方法
const { crudExpose } = useExpose({ crudRef, crudBinding })
// 你的crud配置
const { crudOptions } = createCrudOptions({ context: {}, crudExpose })
// 初始化crud配置
const { resetCrudOptions } = useCrud({ crudExpose, crudOptions })

// 页面加载完成后执行
onMounted(() => {
  crudExpose.doRefresh()
})
</script>