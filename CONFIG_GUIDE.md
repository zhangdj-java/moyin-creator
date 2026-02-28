# 🎬 AI影视生产工具 - 配置清单

## 📋 配置概览

本项目需要配置以下API服务才能正常使用AI功能：

| 服务类型 | 用途 | 是否必须 |
|---------|------|---------|
| AI大模型API | 剧本分析、对话生成 | ✅ 必须 |
| 图像生成API | 角色/场景图片生成 | ✅ 必须 |
| 视频生成API | 将图片转为视频 | ✅ 必须 |
| 图床API | 图片托管 | ⚠️ 推荐 |

---

## 🔑 需要配置的API Keys

### 1. AI大模型API（推荐：魔因API）

**用途**: 剧本分析、文本生成、图片理解

**推荐供应商**:
- **魔因API (memefast)** ⭐ 推荐
  - 官网: https://memefast.top
  - 支持模型: DeepSeek、Gemini、GPT-4、Claude等
  - 功能: 文本、识图、图片生成、视频生成
  
- **其他可选**:
  - OpenAI API
  - Anthropic Claude API
  - Google Gemini API

**需要用户提供**: API Key

---

### 2. 图像生成API

**用途**: 角色参考图、场景图、分镜图生成

**推荐供应商**:
- **魔因API** (内置支持DALL-E、Flux、Midjourney等)
- **RunningHub** ⭐ 推荐（视角切换/多角度生成）
  - 官网: https://www.runninghub.cn
  - 专业AI生图平台
- **其他**:
  - Stability AI (Stable Diffusion)
  - Midjourney API
  - OpenAI DALL-E

**需要用户提供**: API Key

---

### 3. 视频生成API ⭐ 核心功能

**用途**: 将图片转换为视频（图生视频）

**支持模型**:
- **Seedance 1.5** (字节跳动) ⭐ 推荐
- **Sora** (OpenAI)
- **Veo 3** (Google)
- **Kling** (快手)
- **Runway Gen-3**
- **Luma**
- **Wan 2.6**

**推荐供应商**:
- **魔因API** - 支持上述所有模型
- **Seedance官方API** - https://seedance.io

**需要用户提供**: API Key

---

### 4. 图床API（可选但推荐）

**用途**: 托管生成的图片，便于分享和引用

**推荐供应商**:
- **imgbb** - 免费，简单易用
  - 官网: https://api.imgbb.com
  - 免费额度: 通常足够个人使用
- **Cloudflare R2** - 专业级
- **自定义图床** - 如有自己的存储服务

**需要用户提供**: API Key（可选）

---

## 📝 配置步骤

### 方式一: 应用内配置（推荐）

1. **启动应用**
   ```bash
   cd /root/.openclaw/workspace/moyin-creator
   npm run dev
   ```

2. **进入设置页面**
   - 点击左侧菜单 "设置"
   - 或按快捷键打开设置面板

3. **添加API供应商**
   - 点击 "添加供应商"
   - 选择平台类型（魔因API/RunningHub/自定义）
   - 填入API Key
   - 保存

4. **功能绑定**
   - 剧本分析 → 绑定文本模型（如DeepSeek）
   - 角色生成 → 绑定图像模型（如DALL-E/Flux）
   - 视频生成 → 绑定视频模型（如Seedance）

### 方式二: 环境变量配置

创建 `.env` 文件:
```bash
# AI API配置
MEMEFAST_API_KEY=your_memefast_api_key_here
RUNNINGHUB_API_KEY=your_runninghub_api_key_here

# 图床配置（可选）
IMGBB_API_KEY=your_imgbb_api_key_here
```

---

## 🛒 如何获取API Key

### 魔因API (推荐)
1. 访问 https://memefast.top
2. 注册账号
3. 充值（支持支付宝/微信）
4. 在控制台获取API Key

### RunningHub
1. 访问 https://www.runninghub.cn
2. 注册账号
3. 购买算力或套餐
4. 在API管理页面获取Key

### Seedance官方
1. 访问 https://seedance.io
2. 申请API访问权限
3. 获取API Key

### imgbb
1. 访问 https://api.imgbb.com
2. 免费注册
3. 获取API Key

---

## ⚡ 快速开始（最小配置）

**最少需要1个API Key即可运行**:

推荐使用 **魔因API**，一个Key支持所有功能：
- 剧本分析（文本模型）
- 角色/场景生成（图像模型）
- 视频生成（Seedance等视频模型）

---

## ❓ 常见问题

### Q: 没有API Key能运行吗？
A: 可以启动，但无法使用AI功能。只能查看界面和示例数据。

### Q: 需要多少钱？
A: 
- 开发测试：魔因API充50-100元足够
- 正式生产：根据使用量，比直接使用官方API便宜

### Q: 可以用免费的API吗？
A: 
- 部分平台有免费额度（如imgbb）
- AI生成通常需要付费，但费用较低

### Q: 配置错了怎么办？
A: 在设置页面可以修改或删除API配置，重新添加即可。

---

## 📞 获取帮助

- 魔因API问题: https://memefast.top/docs
- RunningHub问题: https://www.runninghub.cn/help
- 项目问题: https://github.com/zhangdj-java/moyin-creator/issues

---

**配置完成后，即可开始使用AI影视创作功能！** 🎬
