# 🖥️ 远程GUI访问方案

## 问题
Electron应用需要GUI环境，服务器无桌面环境

## 解决方案

### 方案1: VNC远程桌面（推荐）

安装桌面环境和VNC服务器：

```bash
# 安装桌面环境
yum groupinstall -y "Server with GUI"

# 安装VNC服务器
yum install -y tigervnc-server tigervnc-server-module

# 设置VNC密码
vncpasswd

# 启动VNC
vncserver :1 -geometry 1280x720 -depth 24

# 连接地址: 43.167.176.97:5901
```

### 方案2: X11转发（SSH）

本地电脑需要X11服务器（Windows: Xming, Mac: XQuartz）

```bash
# 本地电脑连接时添加-X参数
ssh -X root@43.167.176.97

# 然后启动应用
cd /root/.openclaw/workspace/moyin-creator
./start-with-public-access.sh
```

### 方案3: noVNC（Web浏览器访问VNC）

通过浏览器访问桌面：

```bash
# 安装noVNC
yum install -y novnc websockify

# 启动（需要配置）
/usr/share/novnc/utils/launch.sh --vnc localhost:5901
```

### 方案4: 本地运行桌面客户端

在本地电脑运行Electron应用，配置使用远程API：

```typescript
// 修改 src/config/app.config.ts
export const appConfig = {
  ai: {
    memefast: {
      enabled: true,
      apiKey: 'sk-rCG91opkqcIrLuTmOX36zIYbAyGbYTZzRPCB4iYZJwR4KpzW',
      baseUrl: 'https://memefast.top', // 使用魔因API
      // ...
    }
  }
}
```

## 推荐方案

**本地运行桌面客户端 + 远程API**

优点：
- 最佳用户体验
- 完整的桌面功能
- 利用远程API进行AI生成

步骤：
1. 在本地电脑安装Node.js
2. 克隆项目
3. 配置API Key
4. 运行桌面应用

---
