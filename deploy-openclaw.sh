#!/bin/bash
# 🚀 OpenClaw部署脚本
# 将AI影视工具部署到OpenClaw服务器

set -e

echo "=============================================="
echo "🚀 AI影视工具 - OpenClaw部署"
echo "=============================================="
echo ""

PROJECT_DIR="/root/.openclaw/workspace/moyin-creator"
APP_NAME="moyin-creator"

cd $PROJECT_DIR

# 检查Node.js
echo "📋 检查环境..."
node --version || { echo "❌ Node.js未安装"; exit 1; }
npm --version || { echo "❌ npm未安装"; exit 1; }

echo "✅ 环境检查通过"
echo ""

# 安装依赖（如未安装）
if [ ! -d "node_modules" ]; then
    echo "📦 安装依赖..."
    npm install
    echo "✅ 依赖安装完成"
else
    echo "✅ 依赖已存在，跳过安装"
fi
echo ""

# 检查是否有AppImage
if [ -f "release/魔因漫创-0.1.7.AppImage" ]; then
    echo "📦 发现已构建的AppImage"
    echo "   路径: release/魔因漫创-0.1.7.AppImage"
    echo ""
    echo "🎯 运行方式:"
    echo "   ./release/魔因漫创-0.1.7.AppImage"
    echo ""
fi

# 创建启动脚本
echo "📝 创建启动脚本..."
cat > start-openclaw.sh << 'EOF'
#!/bin/bash
# AI影视工具 - OpenClaw启动脚本

PROJECT_DIR="/root/.openclaw/workspace/moyin-creator"

cd $PROJECT_DIR

echo "🎬 启动AI影视工具..."
echo ""

# 检查虚拟显示（服务器通常无GUI）
if [ -z "$DISPLAY" ]; then
    echo "⚠️ 未检测到显示环境"
    echo "   如需GUI，请先运行: Xvfb :1 -screen 0 1024x768x16 &"
    echo "   然后设置: export DISPLAY=:1"
    echo ""
fi

# 启动开发服务器
echo "🚀 启动开发模式..."
echo "   访问地址: http://localhost:5173 (如配置了远程访问)"
echo ""
npm run dev
EOF

chmod +x start-openclaw.sh
echo "✅ 启动脚本创建完成: start-openclaw.sh"
echo ""

# 创建后台运行脚本
cat > start-background.sh << 'EOF'
#!/bin/bash
# AI影视工具 - 后台运行（使用nohup）

PROJECT_DIR="/root/.openclaw/workspace/moyin-creator"
LOG_FILE="/root/.openclaw/workspace/moyin-creator/app.log"

cd $PROJECT_DIR

echo "🎬 启动AI影视工具（后台模式）..."
echo "   日志文件: $LOG_FILE"
echo ""

# 设置虚拟显示
if [ -z "$DISPLAY" ]; then
    export DISPLAY=:1
fi

# 后台启动
nohup npm run dev > $LOG_FILE 2>&1 &

echo "✅ 应用已在后台启动"
echo "   PID: $!"
echo ""
echo "查看日志: tail -f $LOG_FILE"
echo "停止应用: kill $!"
EOF

chmod +x start-background.sh
echo "✅ 后台启动脚本创建完成: start-background.sh"
echo ""

# 创建systemd服务文件（可选）
cat > moyin-creator.service << 'EOF'
[Unit]
Description=AI影视生产工具
After=network.target

[Service]
Type=simple
User=root
WorkingDirectory=/root/.openclaw/workspace/moyin-creator
Environment=DISPLAY=:1
Environment=NODE_ENV=production
ExecStart=/usr/bin/npm run dev
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF

echo "✅ Systemd服务文件创建完成: moyin-creator.service"
echo ""
echo "   安装服务:"
echo "     sudo cp moyin-creator.service /etc/systemd/system/"
echo "     sudo systemctl daemon-reload"
echo "     sudo systemctl enable moyin-creator"
echo "     sudo systemctl start moyin-creator"
echo ""

# 创建环境变量模板
cat > .env.example << 'EOF'
# 🎬 AI影视工具 - 环境变量配置模板
# 复制为 .env 并填入你的API Keys

# 魔因API（推荐）
MEMEFAST_API_KEY=your_memefast_api_key_here

# RunningHub（视角切换/多角度生成）
RUNNINGHUB_API_KEY=your_runninghub_api_key_here

# 图床API（可选）
IMGBB_API_KEY=your_imgbb_api_key_here

# 显示配置（服务器无GUI时需要）
DISPLAY=:1
EOF

echo "✅ 环境变量模板创建完成: .env.example"
echo ""

# 总结
echo "=============================================="
echo "✅ 部署准备完成！"
echo "=============================================="
echo ""
echo "📂 项目位置: $PROJECT_DIR"
echo ""
echo "🚀 启动方式:"
echo ""
echo "  1. 交互式启动:"
echo "     cd $PROJECT_DIR"
echo "     ./start-openclaw.sh"
echo ""
echo "  2. 后台启动:"
echo "     cd $PROJECT_DIR"
echo "     ./start-background.sh"
echo ""
echo "  3. 使用AppImage:"
echo "     ./release/魔因漫创-0.1.7.AppImage"
echo ""
echo "⚙️ 配置说明:"
echo ""
echo "  请先阅读: CONFIG_GUIDE.md"
echo "  配置API Keys后即可使用AI功能"
echo ""
echo "📞 帮助:"
echo "  问题反馈: https://github.com/zhangdj-java/moyin-creator/issues"
echo ""
echo "=============================================="
