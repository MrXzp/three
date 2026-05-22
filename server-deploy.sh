#!/bin/bash
#===============================================
# 三角洲陪玩平台 - 一键部署脚本
# 使用方法: bash deploy.sh
#===============================================

# 配置 - 根据你的实际情况修改
PROJECT_DIR="/www/wwwroot/admin-system"
GIT_REPO="git@github.com:MrXzp/three.git"
BRANCH="master"
PYTHON_BIN="python3"
VENV_DIR="/www/wwwroot/admin-system/venv"

# 数据库配置（请修改为你的实际数据库信息）
DB_NAME="admin_system"
DB_USER="root"
DB_PASS="8tECebYJswmXHk5b"
DB_HOST="127.0.0.1"
DB_PORT="3306"

# Redis配置
REDIS_HOST="127.0.0.1"
REDIS_PORT="6379"
REDIS_PASS="DVADMIN3"

# 服务配置
SERVICE_PORT=18088
DOMAIN="api.ifyoui.com"

# 颜色
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}   三角洲陪玩平台 - 自动化部署脚本   ${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# 检查是否为root用户
if [ "$EUID" -ne 0 ]; then
    echo -e "${YELLOW}警告: 不是root用户，某些操作可能需要sudo${NC}"
fi

# 1. 进入项目目录
echo -e "${YELLOW}[1/9] 进入项目目录...${NC}"
cd $PROJECT_DIR || {
    echo -e "${RED}错误: 项目目录不存在: $PROJECT_DIR${NC}"
    echo -e "${YELLOW}请先执行: mkdir -p $PROJECT_DIR && cd $PROJECT_DIR && git clone $GIT_REPO .${NC}"
    exit 1
}
echo -e "${GREEN}✓ 已进入: $(pwd)${NC}"

# 2. 配置Git SSH（如果需要）
echo -e "${YELLOW}[2/9] 配置Git SSH...${NC}"
if [ ! -f ~/.ssh/id_rsa ]; then
    echo -e "${YELLOW}生成SSH密钥...${NC}"
    ssh-keygen -t ed25519 -C "deploy@server" -f ~/.ssh/id_ed25519 -N ""
    echo -e "${YELLOW}请将以下公钥添加到GitHub:${NC}"
    cat ~/.ssh/id_ed25519.pub
    echo -e "${YELLOW}添加完成后按回车继续...${NC}"
    read
fi

# 3. 拉取最新代码
echo -e "${YELLOW}[3/9] 拉取最新代码...${NC}"
git fetch origin $BRANCH
git reset --hard origin/$BRANCH
if [ $? -ne 0 ]; then
    echo -e "${RED}错误: Git操作失败${NC}"
    exit 1
fi
echo -e "${GREEN}✓ 代码已更新到最新版本${NC}"

# 4. 配置环境变量文件
echo -e "${YELLOW}[4/9] 配置环境变量...${NC}"
cat > $PROJECT_DIR/backend/conf/env.py << EOF
import os

from application.settings import BASE_DIR

# ================================================= #
# *************** mysql数据库 配置  *************** #
# ================================================= #
DATABASE_ENGINE = "django.db.backends.mysql"
DATABASE_NAME = '$DB_NAME'
DATABASE_HOST = '$DB_HOST'
DATABASE_PORT = $DB_PORT
DATABASE_USER = "$DB_USER"
DATABASE_PASSWORD = '$DB_PASS'

# 表前缀
TABLE_PREFIX = "dvadmin_"

# ================================================= #
# ******** redis配置，无redis 可不进行配置  ******** #
# ================================================= #
REDIS_DB = 1
CELERY_BROKER_DB = 3
REDIS_PASSWORD = '$REDIS_PASS'
REDIS_HOST = '$REDIS_HOST'
REDIS_URL = f'redis://:{REDIS_PASSWORD or ""}@{REDIS_HOST}:$REDIS_PORT'

# ================================================= #
# ****************** 功能 启停  ******************* #
# ================================================= #
DEBUG = False
ENABLE_LOGIN_ANALYSIS_LOG = False
LOGIN_NO_CAPTCHA_AUTH = False

# ================================================= #
# ****************** 其他 配置  ******************* #
# ================================================= #
ALLOWED_HOSTS = ["*", "$DOMAIN"]
COLUMN_EXCLUDE_APPS = []
EOF
echo -e "${GREEN}✓ 环境变量已配置${NC}"

# 5. 创建Python虚拟环境
echo -e "${YELLOW}[5/9] 设置Python虚拟环境...${NC}"
if [ ! -d "$VENV_DIR" ]; then
    $PYTHON_BIN -m venv $VENV_DIR
    echo -e "${GREEN}✓ 虚拟环境已创建${NC}"
else
    echo -e "${GREEN}✓ 虚拟环境已存在${NC}"
fi

# 6. 安装依赖
echo -e "${YELLOW}[6/9] 安装Python依赖...${NC}"
source $VENV_DIR/bin/activate
pip install --upgrade pip -q
pip install -r requirements.txt -q
if [ $? -ne 0 ]; then
    echo -e "${YELLOW}安装核心依赖...${NC}"
    pip install Django==4.2.14 djangorestframework==3.15.2 django-cors-headers==4.4.0
    pip install mysqlclient pymysql gunicorn
fi
echo -e "${GREEN}✓ 依赖安装完成${NC}"

# 7. 数据库迁移
echo -e "${YELLOW}[7/9] 执行数据库迁移...${NC}"
cd $PROJECT_DIR/backend
python manage.py migrate --noinput
if [ $? -ne 0 ]; then
    echo -e "${YELLOW}警告: 迁移可能有问题，请检查数据库配置${NC}"
else
    echo -e "${GREEN}✓ 数据库迁移完成${NC}"
fi

# 8. 收集静态文件
echo -e "${YELLOW}[8/9] 收集静态文件...${NC}"
python manage.py collectstatic --noinput
echo -e "${GREEN}✓ 静态文件收集完成${NC}"

# 9. 重启服务
echo -e "${YELLOW}[9/9] 重启服务...${NC}"

# 停止旧进程
pkill -f "gunicorn.*application" 2>/dev/null || true
sleep 2

# 使用gunicorn启动
cd $PROJECT_DIR/backend
gunicorn application.wsgi:application -b 127.0.0.1:$SERVICE_PORT -w 4 --daemon \
    --access-logfile $PROJECT_DIR/backend/logs/access.log \
    --error-logfile $PROJECT_DIR/backend/logs/error.log

# 检查服务状态
sleep 2
if pgrep -f "gunicorn.*application" > /dev/null; then
    echo -e "${GREEN}✓ 服务已启动: 127.0.0.1:$SERVICE_PORT${NC}"
else
    echo -e "${RED}错误: 服务启动失败，请检查日志${NC}"
fi

echo ""
echo -e "${BLUE}========================================${NC}"
echo -e "${GREEN}   部署完成！   ${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""
echo "项目目录: $PROJECT_DIR"
echo "后端服务: http://127.0.0.1:$SERVICE_PORT"
echo "宝塔反代: https://$DOMAIN"
echo ""
echo "常用命令:"
echo "  查看日志: tail -f $PROJECT_DIR/backend/logs/access.log"
echo "  重启服务: pkill -f gunicorn && cd $PROJECT_DIR/backend && gunicorn application.wsgi:application -b 127.0.0.1:$SERVICE_PORT -w 4 --daemon"
echo "  进入虚拟环境: source $VENV_DIR/bin/activate"
echo ""
