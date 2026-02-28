#!/bin/bash
# Electron wrapper script - 自动添加--no-sandbox参数

# 获取真正的electron路径
ELECTRON_BIN="$1"
shift

# 添加--no-sandbox参数
exec "$ELECTRON_BIN" --no-sandbox --disable-setuid-sandbox "$@"
