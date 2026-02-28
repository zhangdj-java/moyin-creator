#!/bin/bash
# 🔍 网络诊断脚本

echo "=============================================="
echo "🔍 AI影视工具 - 网络诊断"
echo "=============================================="
echo ""

echo "📊 1. 服务状态"
echo "----------------------------------------------"
ss -tlnp | grep 5173 || echo "   ❌ 端口未监听"
echo ""

echo "📊 2. 防火墙规则"
echo "----------------------------------------------"
iptables -L INPUT -n | grep 5173 || echo "   ⚠️ 未找到5173规则"
echo ""

echo "📊 3. 本地访问测试"
echo "----------------------------------------------"
echo -n "   127.0.0.1:5173 -> "
curl -s -o /dev/null -w "%{http_code}" http://127.0.0.1:5173
echo ""
echo -n "   localhost:5173 -> "
curl -s -o /dev/null -w "%{http_code}" http://localhost:5173
echo ""
echo -n "   43.167.176.97:5173 -> "
curl -s -o /dev/null -w "%{http_code}" http://43.167.176.97:5173 2>/dev/null || echo "连接失败"
echo ""

echo "📊 4. 网络接口"
echo "----------------------------------------------"
ip addr show | grep "inet " | head -3
echo ""

echo "📊 5. 路由信息"
echo "----------------------------------------------"
ip route | head -3
echo ""

echo "📊 6. 监听的服务"
echo "----------------------------------------------"
ps aux | grep -E "electron|electron-vite" | grep -v grep | wc -l | xargs echo "   运行进程数:"
echo ""

echo "=============================================="
echo "📋 诊断建议"
echo "=============================================="
echo ""
echo "如果本地测试200但外网无法访问:"
echo ""
echo "1. 检查云服务商安全组/防火墙"
echo "   - 腾讯云: 安全组需开放5173端口"
echo "   - 阿里云: 安全组规则添加5173"
echo "   - AWS: Security Group入站规则"
echo ""
echo "2. 检查系统防火墙"
echo "   firewall-cmd --add-port=5173/tcp --permanent"
echo "   firewall-cmd --reload"
echo ""
echo "3. 检查网络ACL"
echo "   某些云服务商有额外的网络ACL控制"
echo ""
echo "4. 测试命令(在其他机器执行):"
echo "   curl http://43.167.176.97:5173"
echo "   telnet 43.167.176.97 5173"
echo ""
echo "=============================================="
