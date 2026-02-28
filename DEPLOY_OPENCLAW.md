# 🎬 AI影视生产工具 - OpenClaw部署指南

## 📋 项目概况

基于 **魔因漫创 (Moyin Creator)** 改造的个性化AI影视生产工具

- **原版项目**: https://github.com/MemeCalculate/moyin-creator
- **技术栈**: Electron 30 + React 18 + TypeScript
- **许可证**: AGPL-3.0

---

## 🚀 快速开始

### 1. 环境准备

```bash
# 检查Node.js版本
node --version  # 需要 >= 18

# 检查npm版本
npm --version   # 需要 >= 9
```

### 2. 安装依赖

```bash
cd moyin-creator
npm install
```

### 3. 启动开发模式

```bash
npm run dev
```

---

## ⚙️ 配置说明

### API配置

启动应用后，进入 **设置 → API配置**，配置以下服务商：

1. **Seedance 2.0** (视频生成)
   - API Key: 你的Seedance API密钥
   - Base URL: https://api.seedance.io

2. **图像生成API**
   - Stable Diffusion / Midjourney / DALL-E
   - 填入对应的API Key

3. **其他AI服务**
   - 根据需求配置其他图像/视频生成服务

### 自定义配置

编辑 `src/config/app.config.ts`：

```typescript
export const appConfig = {
  app: {
    name: '你的应用名称',
    version: '0.1.7',
  },
  ai: {
    seedance: {
      enabled: true,
      apiKey: '你的API Key',
    },
  },
  // ... 其他配置
};
```

---

## 📦 构建部署

### Linux构建

```bash
npm run build:linux
```

输出文件在 `release/` 目录：
- `.AppImage` - 可执行文件
- `.deb` - Debian/Ubuntu安装包
- `.tar.gz` - 压缩包

### Windows构建

```bash
npm run build:win
```

### macOS构建

```bash
npm run build:mac
```

---

## 🌐 部署到OpenClaw服务器

### 方式1: 直接运行开发模式

```bash
cd /root/.openclaw/workspace/moyin-creator
npm run dev
```

### 方式2: 构建后运行

```bash
# 构建Linux版本
npm run build:linux

# 运行AppImage
./release/*.AppImage
```

### 方式3: 使用PM2守护进程

```bash
# 安装PM2
npm install -g pm2

# 创建启动脚本
cat > start.sh << 'EOF'
#!/bin/bash
export DISPLAY=:1
npm run dev
EOF

# 使用PM2启动
pm2 start start.sh --name "ai-video-tool"
pm2 save
```

---

## 🔧 常见问题

### 1. 构建失败

```bash
# 清理缓存
rm -rf node_modules
rm -rf out dist release
npm install
npm run build:linux
```

### 2. 缺少显示设备

Linux服务器通常没有GUI，需要配置虚拟显示：

```bash
# 安装虚拟显示
sudo apt-get install xvfb

# 启动虚拟显示
Xvfb :1 -screen 0 1024x768x16 &
export DISPLAY=:1

# 运行应用
npm run dev
```

### 3. 权限问题

```bash
# 给AppImage添加执行权限
chmod +x release/*.AppImage
```

---

## 📝 项目结构

```
moyin-creator/
├── electron/          # Electron主进程
├── src/
│   ├── components/    # React组件
│   ├── config/        # 配置文件
│   ├── lib/           # 工具库
│   └── stores/        # 状态管理
├── build/             # 构建资源
├── docs/              # 文档
├── release/           # 构建输出
└── demo-data/         # 示例数据
```

---

## 🔗 相关链接

- **原版项目**: https://github.com/MemeCalculate/moyin-creator
- **Electron文档**: https://www.electronjs.org/docs
- **Vite文档**: https://vitejs.dev/guide/
- **React文档**: https://react.dev/

---

## 📄 许可证

本项目采用 **AGPL-3.0** 许可证开源。

如需商业使用，请联系原项目作者获取商业许可。

---

## 🤝 贡献

欢迎提交Issue和PR！

---

**部署时间**: 2026-02-28  
**部署者**: 小码
