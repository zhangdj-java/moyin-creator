#!/bin/bash
# AI影视工具 - OpenClaw启动脚本（Root用户适配版）

PROJECT_DIR="/root/.openclaw/workspace/moyin-creator"

cd $PROJECT_DIR

echo "🎬 启动AI影视工具..."
echo ""

# 检查是否在root用户运行
if [ "$EUID" -eq 0 ]; then
    echo "👤 检测到root用户运行"
    echo "   已自动配置 --no-sandbox 参数"
    echo ""
fi

# 检查虚拟显示（服务器通常无GUI）
if [ -z "$DISPLAY" ]; then
    echo "⚠️ 未检测到显示环境"
    echo "   如需GUI，请先运行: Xvfb :1 -screen 0 1024x768x16 &"
    echo "   然后设置: export DISPLAY=:1"
    echo ""
fi

# 启动开发服务器
echo "🚀 启动开发模式..."
echo "   访问地址: http://localhost:5173"
echo ""

npm run dev