// 🎬 AI影视生产工具 - 应用配置
// 自定义配置覆盖默认设置

export const appConfig = {
  // 应用信息
  app: {
    name: 'AI影视创作工具',
    version: '0.1.7',
    description: 'AI驱动的影视创作平台',
  },
  
  // AI服务商配置（用户需要填入自己的API Key）
  ai: {
    // Seedance 2.0
    seedance: {
      enabled: true,
      apiKey: process.env.SEEDANCE_API_KEY || '',
      baseUrl: 'https://api.seedance.io',
    },
    // 图像生成
    image: {
      provider: 'stable-diffusion', // 或其他支持的提供商
      apiKey: process.env.IMAGE_API_KEY || '',
    },
    // 视频生成
    video: {
      provider: 'seedance',
      apiKey: process.env.VIDEO_API_KEY || '',
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
