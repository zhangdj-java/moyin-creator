#!/bin/bash
# AI影视工具 - 使用环境变量禁用sandbox启动

cd /root/.openclaw/workspace/moyin-creator

echo "🎬 启动AI影视工具..."
echo ""

# 清理缓存
rm -rf out dist

echo "🔧 配置Electron环境（禁用sandbox）..."
# 使用环境变量禁用sandbox
export ELECTRON_DISABLE_SANDBOX=1

echo "🚀 启动开发服务器..."
echo ""

npm run dev
