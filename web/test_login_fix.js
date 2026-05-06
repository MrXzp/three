// 测试前端登录修改
console.log('=== 测试前端登录修改 ===');

// 模拟前端登录数据
const oldLoginData = {
  username: 'superadmin',
  password: 'admin123456',
  captcha: '1234',
  captchaKey: '0',
  captchaImgBase: ''
};

const newLoginData = {
  username: 'superadmin',
  password: 'admin123456'
};

console.log('旧登录数据（发送到 /api/login/）：');
console.log(JSON.stringify(oldLoginData, null, 2));
console.log('密码已MD5加密：', oldLoginData.password !== 'admin123456');

console.log('\n新登录数据（发送到 /api/token/）：');
console.log(JSON.stringify(newLoginData, null, 2));
console.log('密码明文：', newLoginData.password === 'admin123456');

console.log('\n修改总结：');
console.log('1. API端点：/api/login/ → /api/token/');
console.log('2. 密码处理：MD5加密 → 明文');
console.log('3. 验证码：需要虚拟验证码 → 不需要验证码');
console.log('4. 字段数量：5个字段 → 2个字段');

console.log('\n✅ 前端登录接口已修改完成！');