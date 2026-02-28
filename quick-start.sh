#!/bin/bash
# 🚀 快速启动脚本 - 桌面客户端

echo "=============================================="
echo "🎬 AI影视工具 - 快速启动"
echo "=============================================="
echo ""

# 检查Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js 未安装"
    echo ""
    echo "请访问 https://nodejs.org/ 下载安装 LTS 版本"
    echo ""
    exit 1
fi

NODE_VERSION=$(node --version | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
    echo "⚠️ Node.js 版本过低: $(node --version)"
    echo "   需要 >= 18.0.0"
    echo "   请升级 Node.js"
    exit 1
fi

echo "✅ Node.js: $(node --version)"
echo "✅ npm: $(npm --version)"
echo ""

# 检查项目目录
if [ ! -f "package.json" ]; then
    echo "📥 克隆项目..."
    git clone https://github.com/zhangdj-java/moyin-creator.git .
    if [ $? -ne 0 ]; then
        echo "❌ 克隆失败"
        exit 1
    fi
fi

# 检查依赖
if [ ! -d "node_modules" ]; then
    echo "📦 安装依赖..."
    npm install
    if [ $? -ne 0 ]; then
        echo "❌ 安装失败"
        exit 1
    fi
    echo "✅ 依赖安装完成"
    echo ""
fi

# 启动应用
echo "🚀 启动AI影视工具..."
echo ""
npm run dev
