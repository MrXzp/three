import json
import os
import sys

# 添加项目路径
project_path = os.path.dirname(os.path.abspath(__file__))
os.chdir(project_path)
sys.path.insert(0, project_path)
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'application.settings')

import django
django.setup()

# 读取JSON
with open(r'D:\Users\Lenovo\.openclaw\workspace\admin-system\backend\full_data_v4.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

# 过滤
skip_prefixes = ['log', 'operationlog', 'loginlog', 'captcha', 'captchastore', 'sessions', 'celery', 'django_admin']

filtered = []
for item in data:
    model = item['model'].lower()
    if any(p in model for p in skip_prefixes):
        continue
    has_emoji = False
    for v in item.get('fields', {}).values():
        if isinstance(v, str):
            try:
                v.encode('utf-8')
            except:
                has_emoji = True
    if not has_emoji:
        filtered.append(item)

print(f'Total: {len(data)}, Filtered: {len(filtered)}')

# 分组
from collections import defaultdict
by_model = defaultdict(list)
for item in filtered:
    by_model[item['model']].append(item)

# 获取表名映射
model_to_table = {}
for model_name in by_model.keys():
    try:
        app, model = model_name.split('.')
        m = django.apps.apps.get_model(app, model)
        model_to_table[model_name] = m._meta.db_table
        if model_name != model_to_table[model_name]:
            print(f'  {model_name} -> {model_to_table[model_name]}')
    except Exception as e:
        model_to_table[model_name] = model_name.replace('.', '_')
        print(f'  {model_name} -> {model_to_table[model_name]} (error: {e})')

# 生成SQL
output_path = r'D:\Users\Lenovo\.openclaw\workspace\admin-system\backend\import.sql'
with open(output_path, 'w', encoding='utf-8') as f:
    f.write("SET FOREIGN_KEY_CHECKS=0;\n")
    f.write("SET UNIQUE_CHECKS=0;\n\n")
    
    for model_name in sorted(by_model.keys()):
        table_name = model_to_table[model_name]
        for item in by_model[model_name]:
            fields = item['fields']
            field_names = list(fields.keys())
            values = []
            
            for v in fields.values():
                if v is None:
                    values.append('NULL')
                elif isinstance(v, bool):
                    values.append('1' if v else '0')
                elif isinstance(v, int):
                    values.append(str(v))
                elif isinstance(v, str):
                    v_escaped = v.replace("'", "''").replace("\\", "\\\\")
                    values.append(f"'{v_escaped}'")
                else:
                    values.append(f"'{str(v)}'")
            
            sql = f"INSERT INTO {table_name} (pk, {', '.join(field_names)}) VALUES ({item['pk']}, {', '.join(values)});\n"
            f.write(sql)
    
    f.write("\nSET FOREIGN_KEY_CHECKS=1;\n")
    f.write("SET UNIQUE_CHECKS=1;\n")

print(f'\nSQL file generated: {output_path}')