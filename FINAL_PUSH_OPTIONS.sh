#!/bin/bash
# 🚀 最终推送方案 - 使用GitHub CLI创建仓库并推送

echo "=============================================="
echo "🚀 GitHub推送最终方案"
echo "=============================================="
echo ""

cd /root/.openclaw/workspace/moyin-creator

# 检查gh是否已登录
echo "📋 检查GitHub CLI登录状态..."
gh auth status

echo ""
echo "=============================================="
echo "方案A: 通过GitHub网站手动上传（推荐）"
echo "=============================================="
echo ""
echo "1. 访问: https://github.com/zhangdj-java/moyin-creator"
echo "2. 点击页面上的 'uploading an existing file' 链接"
echo "3. 拖拽或选择本目录下的所有文件上传"
echo ""
echo "已生成源代码压缩包（不含node_modules）:"
echo "   /root/.openclaw/workspace/moyin-creator-source.tar.gz"
echo ""

echo "=============================================="
echo "方案B: 使用Git命令行（需要配置SSH）"
echo "=============================================="
echo ""
echo "步骤1: 生成SSH密钥"
echo "   ssh-keygen -t ed25519 -C 'your@email.com'"
echo ""
echo "步骤2: 添加公钥到GitHub"
echo "   cat ~/.ssh/id_ed25519.pub"
echo "   复制内容到: https://github.com/settings/keys"
echo ""
echo "步骤3: 配置远程仓库并推送"
echo "   git remote set-url origin git@github.com:zhangdj-java/moyin-creator.git"
echo "   git push origin main --force"
echo ""

echo "=============================================="
echo "方案C: 使用GitHub Desktop（图形界面）"
echo "=============================================="
echo ""
echo "1. 在本地电脑安装GitHub Desktop"
echo "2. 克隆仓库: https://github.com/zhangdj-java/moyin-creator"
echo "3. 将本目录文件复制到克隆的文件夹"
echo "4. 提交并推送"
echo ""

echo "=============================================="
echo "当前项目位置"
echo "=============================================="
echo ""
echo "源代码: /root/.openclaw/workspace/moyin-creator/"
echo "压缩包: /root/.openclaw/workspace/moyin-creator-source.tar.gz"
echo ""
pwd
ls -la

echo ""
echo "=============================================="
echo "Git状态"
echo "=============================================="
git status --short
git log --oneline -3
