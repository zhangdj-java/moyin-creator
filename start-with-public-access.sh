#!/bin/bash
# 🚀 AI影视工具 - 外网访问启动脚本

set -e

PROJECT_DIR="/root/.openclaw/workspace/moyin-creator"

cd $PROJECT_DIR

echo "=============================================="
echo "🎬 AI影视工具 - 外网访问启动"
echo "=============================================="
echo ""
echo "🌐 访问地址:"
echo "   外网: http://43.167.176.97:5173"
echo "   内网: http://localhost:5173"
echo ""

# 检查并启动虚拟显示
if ! pgrep -x "Xvfb" > /dev/null; then
    echo "🔍 启动Xvfb虚拟显示..."
    nohup Xvfb :1 -screen 0 1024x768x24 > /tmp/xvfb.log 2>&1 &
    sleep 2
fi

# 设置环境变量
export DISPLAY=:1
export ELECTRON_DISABLE_SANDBOX=1
source .env 2>/dev/null || true

# 清理并启动
echo "🚀 启动应用..."
rm -rf out dist
nohup npm run dev > /tmp/app-running.log 2>&1 &

sleep 5

# 检查端口
echo ""
echo "📊 端口状态:"
ss -tlnp | grep 5173 || netstat -tlnp | grep 5173 || echo "   等待服务启动..."

echo ""
echo "=============================================="
echo "✅ 应用已启动"
echo "=============================================="
echo ""
echo "访问地址:"
echo "   http://43.167.176.97:5173"
echo ""
echo "查看日志:"
echo "   tail -f /tmp/app-running.log"
echo ""
echo "停止应用:"
echo "   pkill -f 'electron-vite dev'"
echo ""
