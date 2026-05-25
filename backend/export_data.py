import os
import sys
import django

os.chdir(r'D:\Users\Lenovo\.openclaw\workspace\admin-system\backend')
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'application.settings')
django.setup()

from django.core.management import call_command

with open('full_data_v4.json', 'w', encoding='utf-8') as f:
    call_command('dumpdata', 
        exclude=['contenttypes', 'auth.permission', 'sessions.session', 'captcha', 'django_celery_beat', 'django_celery_results'],
        format='json',
        indent=2,
        stdout=f
    )

print('Done!')
