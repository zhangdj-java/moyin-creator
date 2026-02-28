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
