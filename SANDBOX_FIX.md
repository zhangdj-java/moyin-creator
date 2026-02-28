# 🚀 最终解决方案

## 问题
Electron在root用户下运行需要 `--no-sandbox` 参数

## 解决方案

### 方案1: 修改electron源码（推荐）

编辑 `node_modules/electron/dist/electron` 文件（这是electron的可执行文件）

但这需要每次重新安装依赖后都修改。

### 方案2: 使用环境变量（最简单）

```bash
export ELECTRON_DISABLE_SANDBOX=1
npm run dev
```

### 方案3: 创建包装脚本（已创建）

使用 `start-fix.sh` 脚本，它会创建一个electron包装器。

### 方案4: 修改项目使用Vite直接启动（绕过electron-vite）

这需要大量修改，不推荐。

### 方案5: 使用--no-sandbox标志（需要electron-vite支持）

这需要electron-vite正确传递参数。

---

## 推荐做法

运行以下命令：

```bash
cd /root/.openclaw/workspace/moyin-creator
export ELECTRON_DISABLE_SANDBOX=1
npm run dev
```

或者使用已创建的脚本：

```bash
./start-fix.sh
```

---

## 长期解决方案

在 `.bashrc` 或 `.zshrc` 中添加：

```bash
export ELECTRON_DISABLE_SANDBOX=1
```

这样所有electron应用都会自动禁用sandbox。

---

## 注意事项

- 禁用sandbox会降低安全性，但在受控的Docker/VM环境中通常是可接受的
- 这是root用户运行Electron的已知限制
