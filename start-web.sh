#!/bin/bash
# 🌐 AI影视工具 - 纯Web模式启动
# 用于浏览器访问，不启动Electron桌面

set -e

PROJECT_DIR="/root/.openclaw/workspace/moyin-creator"

cd $PROJECT_DIR

echo "=============================================="
echo "🌐 AI影视工具 - Web模式启动"
echo "=============================================="
echo ""
echo "访问地址:"
echo "   http://43.167.176.97:5173"
echo "   http://localhost:5173"
echo ""

# 加载环境变量
source .env 2>/dev/null || true

# 清理缓存
rm -rf out dist node_modules/.vite

echo "🚀 启动Vite开发服务器..."
echo ""

# 只启动Vite，不启动Electron
npx vite --host 0.0.0.0 --port 5173
