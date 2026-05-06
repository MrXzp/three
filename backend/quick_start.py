#!/usr/bin/env python
import os
import sys
import subprocess

def main():
    print("快速启动三角洲行动陪玩平台 - 后台管理系统")
    print("=" * 50)
    
    # 检查依赖
    print("检查依赖...")
    try:
        import django
        print(f"✓ Django 已安装: {django.__version__}")
    except ImportError:
        print("✗ Django 未安装，请先运行: pip install -r requirements.txt")
        return
    
    # 检查数据库
    db_file = "db.sqlite3"
    if not os.path.exists(db_file):
        print(f"数据库文件 {db_file} 不存在，执行迁移...")
        try:
            subprocess.run([sys.executable, "manage.py", "migrate"], check=True)
            print("✓ 数据库迁移完成")
        except subprocess.CalledProcessError as e:
            print(f"✗ 数据库迁移失败: {e}")
            return
    else:
        print(f"✓ 数据库文件已存在: {db_file}")
    
    # 检查超级管理员
    print("检查超级管理员...")
    try:
        from django.contrib.auth import get_user_model
        User = get_user_model()
        if User.objects.filter(username='superadmin').exists():
            print("✓ 超级管理员已存在: superadmin / admin123456")
        else:
            print("⚠ 超级管理员不存在，将创建...")
            User.objects.create_superuser('superadmin', '', 'admin123456')
            print("✓ 超级管理员创建成功: superadmin / admin123456")
    except Exception as e:
        print(f"⚠ 检查管理员时出错: {e}")
    
    # 启动服务器
    print("\n启动开发服务器...")
    print("后台管理系统访问地址: http://127.0.0.1:8000")
    print("默认账号: superadmin")
    print("默认密码: admin123456")
    print("验证码: 已关闭 (LOGIN_NO_CAPTCHA_AUTH=True)")
    print("\n按 Ctrl+C 停止服务器")
    print("=" * 50)
    
    # 启动服务器
    subprocess.run([sys.executable, "manage.py", "runserver", "127.0.0.1:8000"])

if __name__ == "__main__":
    main()