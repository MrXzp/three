import json
import os
import sys

os.chdir(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'application.settings')

import django
django.setup()

from collections import defaultdict

# 读取JSON
with open('full_data_v4.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

# 过滤日志表
skip_prefixes = ['log', 'operationlog', 'loginlog', 'captcha', 'captchastore', 'sessions', 'celery', 'django_admin']

filtered = []
for item in data:
    model = item['model'].lower()
    if any(p in model for p in skip_prefixes):
        continue
    filtered.append(item)

print(f'Total: {len(data)}, Filtered: {len(filtered)}')

# 按模型分组
by_model = defaultdict(list)
for item in filtered:
    by_model[item['model']].append(item)

# 获取模型映射
model_cache = {}
def get_model(model_name):
    if model_name in model_cache:
        return model_cache[model_name]
    try:
        app, model = model_name.split('.')
        m = django.apps.apps.get_model(app, model)
        model_cache[model_name] = (m, m._meta.db_table)
        return model_cache[model_name]
    except Exception as e:
        print(f'Error getting model {model_name}: {e}')
        return None, None

# 获取外键字段
def get_foreign_key_fields(model_class):
    fk_fields = {}
    for field in model_class._meta.get_fields():
        if field.many_to_one and field.related_model:
            fk_fields[field.name] = field.related_model._meta.label_lower
    return fk_fields

# 按依赖顺序导入
import_order = [
    'system.dept',      # 部门
    'system.area',       # 地区
    'system.dictionary', # 字典
    'system.role',       # 角色
    'system.users',      # 用户（依赖角色、部门）
    'system.menu',       # 菜单
    'system.menufield',  # 菜单字段
    'system.menubutton', # 菜单按钮
    'system.rolemenupermission',
    'system.rolemenubuttonpermission',
    'system.filelist',
    'system.apiwhitelist',
    'system.systemconfig',
    'escort.servicecategory',  # 服务分类
    'escort.escortuser',      # 陪玩用户（依赖用户）
    'escort.service',          # 服务（依赖用户、服务分类）
    'escort.serviceimage',     # 服务图片
    'escort.order',           # 订单（依赖用户）
    'escort.orderhunter',     # 订单猎人
    'escort.withdrawal',      # 提现
    'escort.buddyrelation',   # 好友关系（依赖用户）
    'escort.chatmessage',     # 聊天消息（依赖用户、订单）
    'escort.refundrequest',   # 退款请求（依赖用户、订单）
]

# 导入数据
total = 0
success = 0
errors = []

for model_name in import_order:
    if model_name not in by_model:
        print(f'Skip {model_name} (not in data)')
        continue
    
    model_class, table_name = get_model(model_name)
    if not model_class:
        continue
    
    fk_fields = get_foreign_key_fields(model_class)
    print(f'\nImporting {model_name} -> {table_name} ({len(by_model[model_name])} records)')
    print(f'  FK fields: {fk_fields}')
    
    for item in by_model[model_name]:
        total += 1
        try:
            fields = item['fields'].copy()
            pk = item['pk']
            
            # 处理外键字段
            for fk_name, related_model_name in fk_fields.items():
                if fk_name in fields and fields[fk_name] is not None:
                    fk_id = fields[fk_name]
                    try:
                        related_app, related_model = related_model_name.split('.')
                        rel_model = django.apps.apps.get_model(related_app, related_model)
                        related_obj = rel_model.objects.get(pk=fk_id)
                        fields[fk_name] = related_obj
                    except Exception as e:
                        # 如果找不到关联对象，设为None
                        fields[fk_name] = None
            
            # 使用update_or_create
            obj, created = model_class.objects.update_or_create(
                pk=pk,
                defaults=fields
            )
            success += 1
        except Exception as e:
            if len(errors) < 10:
                errors.append(f'{model_name} pk={item["pk"]}: {e}')
            if len(errors) == 10:
                errors.append('(more errors hidden...)')

for err in errors:
    print(f'Error: {err}')

print(f'\n=== Import Complete ===')
print(f'Total: {total}, Success: {success}, Errors: {len(errors)}')
