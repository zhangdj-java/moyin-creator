# 🖥️ 桌面客户端运行指南

## 📋 系统要求

| 项目 | 要求 |
|------|------|
| **操作系统** | Windows 10/11 / macOS 10.15+ / Linux |
| **Node.js** | >= 18.0.0 |
| **npm** | >= 9.0.0 |
| **内存** | 至少 4GB（推荐 8GB） |
| **硬盘** | 至少 2GB 可用空间 |

---

## 🚀 快速开始

### 1. 安装 Node.js

**Windows/macOS:**
- 访问 https://nodejs.org/
- 下载 LTS 版本（推荐 18.x 或 20.x）
- 运行安装程序

**Linux (Ubuntu/Debian):**
```bash
# 使用nvm安装（推荐）
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.bashrc
nvm install 18
nvm use 18
```

**验证安装:**
```bash
node --version  # 应显示 v18.x.x
npm --version   # 应显示 9.x.x
```

---

### 2. 克隆项目

```bash
# 克隆您的GitHub仓库
git clone https://github.com/zhangdj-java/moyin-creator.git

# 进入项目目录
cd moyin-creator
```

---

### 3. 安装依赖

```bash
npm install
```

这会安装约600个npm包，需要几分钟时间。

---

### 4. 配置 API Key

项目已配置好魔因API Key，无需修改即可使用。

如需修改，编辑 `src/config/app.config.ts`：

```typescript
ai: {
  memefast: {
    enabled: true,
    apiKey: 'sk-rCG91opkqcIrLuTmOX36zIYbAyGbYTZzRPCB4iYZJwR4KpzW',
    baseUrl: 'https://memefast.top',
    // ...
  }
}
```

---

### 5. 启动应用

```bash
npm run dev
```

启动后会自动打开桌面窗口。

---

## 📦 构建安装包（可选）

### Windows 安装包

```bash
npm run build:win
```

输出在 `release/` 目录，包含 `.exe` 安装程序。

### macOS 安装包

```bash
npm run build:mac
```

输出 `.dmg` 文件。

### Linux 安装包

```bash
npm run build:linux
```

输出 `.AppImage` 或 `.deb` 文件。

---

## 🔧 常见问题

### Q1: npm install 很慢/失败

**解决方案:**
```bash
# 使用国内镜像
npm config set registry https://registry.npmmirror.com

# 然后重新安装
npm install
```

### Q2: 启动时报错 "Cannot find module"

**解决方案:**
```bash
# 清理缓存重新安装
rm -rf node_modules package-lock.json
npm install
```

### Q3: Electron 启动白屏

**解决方案:**
- Windows: 右键以管理员身份运行
- macOS/Linux: 检查是否缺少依赖库

### Q4: 如何更新到最新版本

```bash
# 拉取最新代码
git pull origin main

# 重新安装依赖（如有更新）
npm install

# 重启应用
npm run dev
```

---

## 🎬 使用流程

### 首次使用

1. **启动应用**
   ```bash
   npm run dev
   ```

2. **进入设置**
   - 点击左侧菜单 "设置"
   - 确认API配置已加载

3. **创建新项目**
   - 点击 "新建项目"
   - 选择项目类型（短剧/动漫/预告片）

4. **开始创作**
   - 📝 剧本 → 粘贴或输入剧本
   - 🎭 角色 → AI生成角色设定
   - 🌄 场景 → 生成场景参考图
   - 🎬 分镜 → 创建分镜故事板
   - ⭐ 视频 → 批量生成视频

---

## 💾 数据存储

项目文件默认保存在：
- **Windows**: `%USERPROFILE%\AppData\Roaming\moyin-creator\`
- **macOS**: `~/Library/Application Support/moyin-creator/`
- **Linux**: `~/.config/moyin-creator/`

---

## 📞 获取帮助

- GitHub Issues: https://github.com/zhangdj-java/moyin-creator/issues
- 魔因API文档: https://memefast.top/docs

---

**🎉 准备好开始AI影视创作了吗？**
