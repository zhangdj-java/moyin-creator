# 🚀 推送到GitHub - 操作指南

## 方法一: 使用GitHub CLI（推荐）

### 1. 安装GitHub CLI
```bash
# Linux
sudo apt-get install gh

# 或使用其他包管理器
```

### 2. 登录GitHub
```bash
gh auth login
# 按提示选择HTTPS和Token登录方式
```

### 3. 创建仓库并推送
```bash
cd /root/.openclaw/workspace/moyin-creator
gh repo create zhangdj-java/moyin-creator --public --push --source=.
```

---

## 方法二: 手动配置HTTPS推送

### 1. 进入项目目录
```bash
cd /root/.openclaw/workspace/moyin-creator
```

### 2. 配置Git用户信息（如未配置）
```bash
git config user.name "Your Name"
git config user.email "your.email@example.com"
```

### 3. 提交更改
```bash
git add -A
git commit -m "🎬 个性化AI影视生产工具配置"
```

### 4. 推送到GitHub
```bash
# 添加你的远程仓库
git remote add origin https://github.com/zhangdj-java/moyin-creator.git

# 推送（会提示输入用户名和Token作为密码）
git push origin main --force
```

---

## 方法三: 使用SSH密钥

### 1. 生成SSH密钥（如没有）
```bash
ssh-keygen -t ed25519 -C "your.email@example.com"
```

### 2. 添加公钥到GitHub
```bash
cat ~/.ssh/id_ed25519.pub
# 复制内容到 GitHub Settings -> SSH and GPG keys -> New SSH key
```

### 3. 推送
```bash
git remote set-url origin git@github.com:zhangdj-java/moyin-creator.git
git push origin main --force
```

---

## 方法四: 直接在GitHub网页上传

1. 访问 https://github.com/zhangdj-java/moyin-creator
2. 点击 "uploading an existing file"
3. 拖拽项目文件上传

---

## 常见问题

### 403 Forbidden错误
原因: Token权限不足或过期
解决: 在GitHub Settings -> Developer settings -> Personal access tokens 生成新Token，确保勾选 `repo` 权限

### 用户名/密码错误
GitHub已不再支持密码登录，请使用Token作为密码

---

## 验证推送成功

推送完成后访问:
https://github.com/zhangdj-java/moyin-creator

确认能看到项目文件
