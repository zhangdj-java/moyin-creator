#!/usr/bin/env node
/**
 * 🧪 魔因API测试脚本
 * 测试API Key是否有效
 */

const API_KEY = 'sk-rCG91opkqcIrLuTmOX36zIYbAyGbYTZzRPCB4iYZJwR4KpzW';
const BASE_URL = 'https://memefast.top';

async function testAPI() {
  console.log('🧪 测试魔因API连接...\n');
  
  try {
    // 测试1: 获取模型列表
    console.log('📋 测试1: 获取可用模型列表');
    const modelsResponse = await fetch(`${BASE_URL}/v1/models`, {
      headers: {
        'Authorization': `Bearer ${API_KEY}`,
        'Content-Type': 'application/json'
      }
    });
    
    if (modelsResponse.ok) {
      const models = await modelsResponse.json();
      console.log('✅ 模型列表获取成功');
      console.log(`   可用模型数量: ${models.data?.length || 0}`);
      console.log(`   部分模型: ${models.data?.slice(0, 5).map(m => m.id).join(', ')}...\n`);
    } else {
      console.log(`❌ 模型列表获取失败: ${modelsResponse.status}`);
      const error = await modelsResponse.text();
      console.log(`   错误: ${error}\n`);
    }
    
    // 测试2: 简单的对话测试
    console.log('💬 测试2: 对话API测试');
    const chatResponse = await fetch(`${BASE_URL}/v1/chat/completions`, {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${API_KEY}`,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        model: 'deepseek-v3.2',
        messages: [
          { role: 'user', content: '你好，请用一句话介绍自己' }
        ],
        max_tokens: 100
      })
    });
    
    if (chatResponse.ok) {
      const result = await chatResponse.json();
      console.log('✅ 对话API测试成功');
      console.log(`   回复: ${result.choices?.[0]?.message?.content}\n`);
    } else {
      console.log(`❌ 对话API测试失败: ${chatResponse.status}`);
      const error = await chatResponse.text();
      console.log(`   错误: ${error}\n`);
    }
    
    console.log('==============================================');
    console.log('✅ API测试完成');
    console.log('==============================================');
    
  } catch (error) {
    console.error('❌ 测试失败:', error.message);
    process.exit(1);
  }
}

testAPI();
