#!/bin/bash
#===============================================
# 三角洲陪玩平台 - 一键部署脚本
# 使用方法: bash deploy.sh
#===============================================

# 配置
PROJECT_DIR="/www/wwwroot/admin-system"
GIT_REPO="git@github.com:你的用户名/admin-system.git"  # 修改为你的Git仓库地址
BRANCH="main"  # 修改为你的分支名

# 颜色
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}   三角洲陪玩平台 - 一键部署脚本   ${NC}"
echo -e "${GREEN}========================================${NC}"

# 1. 进入项目目录
cd $PROJECT_DIR/backend || {
    echo -e "${RED}错误: 项目目录不存在${NC}"
    exit 1
}
echo -e "${YELLOW}[1/6] 进入项目目录: $PROJECT_DIR/backend${NC}"

# 2. 拉取最新代码
echo -e "${YELLOW}[2/6] 拉取最新代码...${NC}"
git pull origin $BRANCH
if [ $? -ne 0 ]; then
    echo -e "${RED}错误: Git拉取失败${NC}"
    exit 1
fi
echo -e "${GREEN}✓ 代码拉取成功${NC}"

# 3. 安装依赖
echo -e "${YELLOW}[3/6] 安装Python依赖...${NC}"
pip install -r requirements.txt -q
if [ $? -ne 0 ]; then
    echo -e "${YELLOW}警告: 部分依赖安装失败，尝试安装 mysql 驱动...${NC}"
    pip install pymysql
fi
echo -e "${GREEN}✓ 依赖安装完成${NC}"

# 4. 数据迁移
echo -e "${YELLOW}[4/6] 执行数据库迁移...${NC}"
python manage.py migrate --noinput
if [ $? -ne 0 ]; then
    echo -e "${YELLOW}警告: 迁移失败（可能已最新或数据库问题）${NC}"
else
    echo -e "${GREEN}✓ 数据库迁移完成${NC}"
fi

# 5. 收集静态文件
echo -e "${YELLOW}[5/6] 收集静态文件...${NC}"
python manage.py collectstatic --noinput
echo -e "${GREEN}✓ 静态文件收集完成${NC}"

# 6. 重启服务
echo -e "${YELLOW}[6/6] 重启服务...${NC}"

# 使用 PM2 重启（如果安装了 PM2）
if command -v pm2 &> /dev/null; then
    pm2 restart admin-system || pm2 start manage.py --name admin-system --interpreter python3 -- \
        runserver 0.0.0.0:18088 --settings=application.settings
    pm2 save
    echo -e "${GREEN}✓ PM2 服务已重启${NC}"
else
    # 使用 gunicorn 重启
    pkill -f "gunicorn.*application" || true
    sleep 2
    cd $PROJECT_DIR/backend
    gunicorn application.wsgi:application -b 127.0.0.1:18088 -w 4 --daemon
    echo -e "${GREEN}✓ Gunicorn 服务已重启${NC}"
fi

echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}   部署完成！🎉                      ${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo "服务地址: http://127.0.0.1:18088"
echo "宝塔反代: https://api.ifyoui.com"
echo ""
