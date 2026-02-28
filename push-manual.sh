#!/bin/bash
# 🚀 GitHub推送脚本 - 手动版
# 使用方法: 复制以下命令并执行

echo "=============================================="
echo "🚀 推送到GitHub"
echo "=============================================="
echo ""

# 检查是否在正确目录
if [ ! -f "package.json" ]; then
    echo "❌ 请在moyin-creator目录下运行此脚本"
    exit 1
fi

# 配置Git（如未配置）
git config user.name "OpenClaw Bot" 2>/dev/null
git config user.email "bot@openclaw.local" 2>/dev/null

# 添加所有文件
echo "📋 添加文件..."
git add -A

# 提交更改
echo "💾 提交更改..."
git commit -m "🎬 个性化AI影视生产工具配置

- 适配Linux构建环境
- 添加自定义配置文件
- 更新electron-builder支持多平台
- 创建部署文档

部署目标: OpenClaw服务器" || echo "无新更改"

# 推送到你的仓库
echo ""
echo "📤 推送到GitHub..."
echo ""

# 方法1: 使用GitHub CLI（推荐）
if command -v gh &> /dev/null; then
    echo "使用GitHub CLI推送..."
    gh repo create zhangdj-java/moyin-creator --public --push --source=. 2>/dev/null || git push https://github.com/zhangdj-java/moyin-creator.git main --force
else
    # 方法2: 使用HTTPS + Token
    echo "请运行以下命令手动推送:"
    echo ""
    echo "git push https://github.com/zhangdj-java/moyin-creator.git main --force"
    echo ""
    echo "或者配置SSH密钥后:"
    echo "git remote add origin git@github.com:zhangdj-java/moyin-creator.git"
    echo "git push origin main --force"
fi

echo ""
echo "=============================================="
echo "✅ 完成!"
echo "📂 仓库地址: https://github.com/zhangdj-java/moyin-creator"
echo "=============================================="
