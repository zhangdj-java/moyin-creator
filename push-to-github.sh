#!/bin/bash
# 🚀 GitHub推送脚本
# 将项目推送到你的GitHub仓库

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}🚀 开始推送到GitHub...${NC}"

# 检查参数
if [ -z "$1" ]; then
    echo -e "${RED}❌ 请提供你的GitHub仓库URL${NC}"
    echo "用法: ./push-to-github.sh https://github.com/你的用户名/你的仓库名.git"
    echo ""
    echo "示例:"
    echo "  ./push-to-github.sh https://github.com/johndoe/my-ai-video-tool.git"
    exit 1
fi

YOUR_REPO=$1

cd /root/.openclaw/workspace/moyin-creator

# 检查git状态
echo -e "${YELLOW}📋 当前Git状态:${NC}"
git status --short

# 添加所有修改
echo -e "${YELLOW}\n📝 添加修改的文件...${NC}"
git add -A

# 提交更改
echo -e "${YELLOW}\n💾 提交更改...${NC}"
git commit -m "🎬 个性化AI影视生产工具配置

- 适配Linux构建环境
- 添加自定义配置文件
- 更新electron-builder支持多平台
- 创建部署文档" || echo -e "${YELLOW}没有新更改需要提交${NC}"

# 添加你的远程仓库
echo -e "${YELLOW}\n🔗 配置你的GitHub仓库...${NC}"
git remote add myrepo $YOUR_REPO 2>/dev/null || git remote set-url myrepo $YOUR_REPO

# 推送到你的仓库
echo -e "${YELLOW}\n📤 推送到你的GitHub仓库...${NC}"
git push myrepo main --force

echo -e "${GREEN}\n✅ 推送完成！${NC}"
echo -e "📂 你的仓库地址: ${YOUR_REPO}"
