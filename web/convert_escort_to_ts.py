#!/usr/bin/env python3
"""
将陪玩模块从JavaScript转换为TypeScript
"""
import os
import re
import shutil

# 陪玩模块目录
ESCORT_DIR = os.path.join(os.path.dirname(__file__), 'src/views/escort')

def convert_module(module_name):
    """转换单个模块"""
    module_dir = os.path.join(ESCORT_DIR, module_name)
    
    if not os.path.exists(module_dir):
        print(f"模块目录不存在: {module_dir}")
        return
    
    # 1. 创建api.ts文件
    api_ts_path = os.path.join(module_dir, 'api.ts')
    if not os.path.exists(api_ts_path):
        # 从crud.js中提取API前缀
        crud_js_path = os.path.join(module_dir, 'crud.js')
        if os.path.exists(crud_js_path):
            with open(crud_js_path, 'r', encoding='utf-8') as f:
                content = f.read()
            
            # 查找API URL
            url_match = re.search(r"url:\s*['\"]([^'\"]+)['\"]", content)
            if url_match:
                api_url = url_match.group(1)
                # 提取前缀（去掉最后的/）
                if api_url.endswith('/'):
                    api_url = api_url[:-1]
                
                # 创建api.ts文件
                api_content = f"""import {{ request }} from '/@/utils/service';
import {{ PageQuery, AddReq, DelReq, EditReq, InfoReq }} from '@fast-crud/fast-crud';

export const apiPrefix = '{api_url}/';

export function GetList(query: PageQuery) {{
    return request({{
        url: apiPrefix,
        method: 'get',
        params: query,
    }});
}}

export function GetObj(id: InfoReq) {{
    return request({{
        url: apiPrefix + id + '/',
        method: 'get',
    }});
}}

export function AddObj(obj: AddReq) {{
    return request({{
        url: apiPrefix,
        method: 'post',
        data: obj,
    }});
}}

export function UpdateObj(obj: EditReq) {{
    return request({{
        url: apiPrefix + obj.id + '/',
        method: 'put',
        data: obj,
    }});
}}

export function DelObj(id: DelReq) {{
    return request({{
        url: apiPrefix + id + '/',
        method: 'delete',
        data: {{ id }},
    }});
}}
"""
                with open(api_ts_path, 'w', encoding='utf-8') as f:
                    f.write(api_content)
                print(f"创建: {api_ts_path}")
    
    # 2. 转换crud.js为crud.ts
    crud_js_path = os.path.join(module_dir, 'crud.js')
    crud_ts_path = os.path.join(module_dir, 'crud.ts')
    
    if os.path.exists(crud_js_path):
        with open(crud_js_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # 转换导入语句
        content = content.replace(
            "import { request } from '/@/utils/service';",
            """import * as api from './api';
import {
    dict,
    UserPageQuery,
    AddReq,
    DelReq,
    EditReq,
    compute,
    CreateCrudOptionsProps,
    CreateCrudOptionsRet
} from '@fast-crud/fast-crud';
import { request } from '/@/utils/service';
import { dictionary } from '/@/utils/dictionary';
import { successMessage } from '/@/utils/message';
import { auth } from '/@/utils/authFunction';"""
        )
        
        # 转换函数签名
        content = content.replace(
            "export const createCrudOptions = function ({ expose }) {",
            "export const createCrudOptions = function ({ crudExpose }: CreateCrudOptionsProps): CreateCrudOptionsRet {"
        )
        
        # 转换pageRequest函数
        # 查找pageRequest函数
        page_request_pattern = r"pageRequest:\s*async\s*\({\s*page,\s*form,\s*sort\s*}\)\s*=>\s*{([^}]+?(?:{[^}]*})*[^}]*?)}"
        page_request_match = re.search(page_request_pattern, content, re.DOTALL)
        
        if page_request_match:
            old_page_request = page_request_match.group(0)
            # 简化：使用API函数
            new_page_request = """        pageRequest: async (query: UserPageQuery) => {
            return await api.GetList(query);
        },"""
            content = content.replace(old_page_request, new_page_request)
        
        # 转换其他请求函数
        # 添加transformRes
        request_pattern = r"request:\s*{([^}]+?(?:{[^}]*})*[^}]*?)}"
        request_match = re.search(request_pattern, content, re.DOTALL)
        
        if request_match:
            old_request = request_match.group(0)
            new_request = """            request: {
                pageRequest,
                addRequest,
                editRequest,
                delRequest,
                transformRes: (res) => {
                    // 转换API响应格式以匹配fast-crud的期望
                    return {
                        currentPage: res?.page || 1,
                        pageSize: res?.limit || 20,
                        total: res?.total || 0,
                        records: res?.data || []
                    };
                }
            },"""
            content = content.replace(old_request, new_request)
        
        # 写入crud.ts文件
        with open(crud_ts_path, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f"转换: {crud_js_path} -> {crud_ts_path}")
        
        # 备份原文件
        shutil.move(crud_js_path, crud_js_path + '.backup')
    
    # 3. 更新index.vue文件
    index_vue_path = os.path.join(module_dir, 'index.vue')
    if os.path.exists(index_vue_path):
        with open(index_vue_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # 添加lang="ts"
        content = content.replace('<script setup>', '<script setup lang="ts">')
        
        # 添加api导入
        if 'import * as api' not in content:
            content = content.replace(
                "import { createCrudOptions } from './crud';",
                "import { createCrudOptions } from './crud';\nimport * as api from './api';"
            )
        
        with open(index_vue_path, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f"更新: {index_vue_path}")

def main():
    """主函数"""
    # 获取所有陪玩模块
    modules = []
    for item in os.listdir(ESCORT_DIR):
        if os.path.isdir(os.path.join(ESCORT_DIR, item)):
            modules.append(item)
    
    print(f"找到陪玩模块: {modules}")
    
    # 转换每个模块
    for module in modules:
        print(f"\n转换模块: {module}")
        convert_module(module)
    
    print("\n转换完成！")

if __name__ == '__main__':
    main()