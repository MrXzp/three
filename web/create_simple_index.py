#!/usr/bin/env python3
"""
为所有escort模块创建简单的index.vue文件
"""
import os

def create_simple_index(module_name):
    """创建简单的index.vue文件"""
    return f"""<template>
  <fs-page>
    <fs-crud ref="crudRef" v-bind="crudBinding" />
  </fs-page>
</template>

<script setup>
import {{ ref, onMounted }} from 'vue'
import {{ useExpose, useCrud }} from '@fast-crud/fast-crud'
import {{ createCrudOptions }} from './crud'

// crud组件ref
const crudRef = ref()
const crudBinding = ref()
// 暴露的方法
const {{ crudExpose }} = useExpose({{ crudRef, crudBinding }})
// 你的crud配置
const {{ crudOptions }} = createCrudOptions({{ crudExpose }})
// 初始化crud配置
const {{ resetCrudOptions }} = useCrud({{ crudExpose, crudOptions }})

// 页面加载完成后执行
onMounted(() => {{
  crudExpose.doRefresh()
}})
</script>"""

def main():
    web_dir = 'D:/Users/Lenovo/.openclaw/workspace/admin-system/web'
    escort_dir = os.path.join(web_dir, 'src/views/escort')
    
    modules = ['buddy', 'order', 'review', 'service', 'service_category', 'user', 'withdrawal']
    
    print('为所有escort模块创建简单的index.vue文件...')
    
    for module_name in modules:
        module_dir = os.path.join(escort_dir, module_name)
        index_file = os.path.join(module_dir, 'index.vue')
        
        # 创建简单的index.vue文件
        content = create_simple_index(module_name)
        
        with open(index_file, 'w', encoding='utf-8') as f:
            f.write(content)
        
        print(f'已创建: {module_name}/index.vue')
    
    print(f'\n已创建 {len(modules)} 个简单的index.vue文件')
    print('现在需要重启前端服务...')

if __name__ == '__main__':
    main()