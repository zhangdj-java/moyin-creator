#!/bin/bash
# 🚀 AI影视工具 - 完整启动脚本（带API配置）

set -e

PROJECT_DIR="/root/.openclaw/workspace/moyin-creator"

cd $PROJECT_DIR

echo "=============================================="
echo "🎬 AI影视工具 - 启动"
echo "=============================================="
echo ""

# 1. 检查并启动虚拟显示
echo "🔍 检查虚拟显示..."
if ! pgrep -x "Xvfb" > /dev/null; then
    echo "   启动Xvfb虚拟显示..."
    nohup Xvfb :1 -screen 0 1024x768x24 > /tmp/xvfb.log 2>&1 &
    sleep 2
    if pgrep -x "Xvfb" > /dev/null; then
        echo "   ✅ Xvfb已启动"
    else
        echo "   ❌ Xvfb启动失败"
        exit 1
    fi
else
    echo "   ✅ Xvfb已在运行"
fi
echo ""

# 2. 设置环境变量
echo "🔧 配置环境..."
export DISPLAY=:1
export ELECTRON_DISABLE_SANDBOX=1
source .env 2>/dev/null || true
echo "   ✅ 环境变量已设置"
echo ""

# 3. 检查依赖
echo "📦 检查依赖..."
if [ ! -d "node_modules" ]; then
    echo "   安装依赖..."
    npm install
fi
echo "   ✅ 依赖已就绪"
echo ""

# 4. 清理缓存
echo "🧹 清理缓存..."
rm -rf out dist
echo "   ✅ 缓存已清理"
echo ""

# 5. 测试API连接
echo "🧪 测试API连接..."
if node test-api.js > /tmp/api-test.log 2>&1; then
    echo "   ✅ API连接正常"
    grep "可用模型数量" /tmp/api-test.log | head -1
else
    echo "   ⚠️ API测试失败，但继续启动应用"
fi
echo ""

# 6. 启动应用
echo "🚀 启动应用..."
echo "   访问地址: http://localhost:5173"
echo "   按 Ctrl+C 停止"
echo ""
echo "=============================================="

npm run dev
