// 🎬 AI影视工具 - 应用配置（已配置API）
// 配置时间: 2026-02-28

export const appConfig = {
  // 应用信息
  app: {
    name: 'AI影视创作工具',
    version: '0.1.7',
    description: 'AI驱动的影视创作平台',
  },
  
  // AI服务商配置（已配置魔因API）
  ai: {
    // 魔因API - 全功能AI中转
    memefast: {
      enabled: true,
      apiKey: 'sk-rCG91opkqcIrLuTmOX36zIYbAyGbYTZzRPCB4iYZJwR4KpzW',
      baseUrl: 'https://memefast.top',
      models: [
        'deepseek-v3.2',
        'glm-4.7',
        'gemini-3-pro-preview',
        'gemini-3-pro-image-preview',
        'gpt-image-1.5',
        'doubao-seedance-1-5-pro-251215',
        'veo3.1',
        'sora-2-all',
        'wan2.6-i2v',
        'grok-video-3-10s',
        'claude-haiku-4-5-20251001',
      ],
      capabilities: ['text', 'vision', 'image_generation', 'video_generation'],
    },
    // 图像生成
    image: {
      provider: 'memefast',
      apiKey: 'sk-rCG91opkqcIrLuTmOX36zIYbAyGbYTZzRPCB4iYZJwR4KpzW',
      baseUrl: 'https://memefast.top',
    },
    // 视频生成
    video: {
      provider: 'memefast',
      apiKey: 'sk-rCG91opkqcIrLuTmOX36zIYbAyGbYTZzRPCB4iYZJwR4KpzW',
      baseUrl: 'https://memefast.top',
    },
  },
  
  // 存储配置
  storage: {
    projectsPath: './projects',
    exportsPath: './exports',
    maxProjectSize: '10GB',
  },
  
  // 功能开关
  features: {
    scriptParser: true,      // 剧本解析
    characterSystem: true,   // 角色系统
    sceneGenerator: true,    // 场景生成
    storyboard: true,        // 分镜系统
    batchProduction: true,   // 批量生产
  },
};

export default appConfig;
