#!/bin/bash
echo "启动三角洲行动陪玩平台 - 后台管理系统"
echo "========================================"

cd backend

# 检查依赖是否安装
if [ ! -f "requirements_installed.flag" ]; then
    echo "安装Python依赖..."
    pip install -r requirements.txt
    touch requirements_installed.flag
fi

# 检查环境配置
if [ ! -f "conf/env.py" ]; then
    echo "配置环境文件..."
    cp conf/env.example.py conf/env.py
    echo "请编辑 conf/env.py 配置数据库信息"
    exit 1
fi

# 执行数据库迁移
echo "执行数据库迁移..."
python manage.py makemigrations
python manage.py migrate

# 初始化数据
echo "初始化数据..."
python manage.py init
python manage.py init_area

# 启动服务器
echo "启动开发服务器..."
echo "后台管理系统访问地址: http://127.0.0.1:8084"
echo "API接口地址: http://127.0.0.1:8084/api/"
echo "默认账号: superadmin"
echo "默认密码: admin123456"
echo ""
echo "按 Ctrl+C 停止服务器"

python manage.py runserver 127.0.0.1:8084