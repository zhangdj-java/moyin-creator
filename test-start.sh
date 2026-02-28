#!/bin/bash
# 🚀 修复后启动测试脚本

cd /root/.openclaw/workspace/moyin-creator

echo "=============================================="
echo "🎬 AI影视工具 - 启动测试"
echo "=============================================="
echo ""
echo "✅ 已修复root用户运行问题"
echo "   - 自动添加 --no-sandbox 参数"
echo ""
echo "🚀 正在启动..."
echo ""

npm run dev
