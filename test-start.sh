#!/bin/bash
# 🚀 修复后启动测试脚本

cd /root/.openclaw/workspace/moyin-creator

echo "=============================================="
echo "🎬 AI影视工具 - 启动测试"
echo "=============================================="
echo ""
echo "✅ 已修复root用户运行问题"
echo "   - 通过vite-plugin-electron配置--no-sandbox"
echo ""
echo "🚀 正在启动..."
echo ""

# 清理缓存确保配置生效
rm -rf out dist

npm run dev
