#!/bin/bash
# AI影视工具 - 使用electron-vite dev启动（自动--no-sandbox）

cd /root/.openclaw/workspace/moyin-creator

echo "🎬 启动AI影视工具..."
echo ""

# 清理之前的构建缓存
rm -rf out dist

echo "🚀 启动开发服务器..."
echo "   注意: 首次启动需要编译，请稍等..."
echo ""

# 使用cross-env或直接传递参数
# electron-vite会将额外的参数传递给electron
npx electron-vite dev -- --no-sandbox --disable-setuid-sandbox
