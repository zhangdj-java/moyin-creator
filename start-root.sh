#!/bin/bash
# AI影视工具 - Root用户启动脚本（强制--no-sandbox）

cd /root/.openclaw/workspace/moyin-creator

echo "🎬 启动AI影视工具（Root模式）..."
echo ""

# 清理之前的构建
rm -rf out dist

echo "📦 构建主进程..."
npx electron-vite build

echo ""
echo "🚀 启动Electron（带--no-sandbox）..."
echo ""

# 直接使用node启动electron并传递--no-sandbox
node node_modules/.bin/electron out/main/index.cjs --no-sandbox --disable-setuid-sandbox
