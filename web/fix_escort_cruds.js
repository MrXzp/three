const fs = require('fs');
const path = require('path');

// 定义模块配置
const modules = [
  {
    name: 'buddy',
    api: '/api/escort/buddy/',
    title: '搭子关系',
    columns: {
      id: { title: 'ID', type: 'number', column: { width: 80 } },
      hunter_a: { title: '打手A', type: 'number' },
      hunter_b: { title: '打手B', type: 'number' },
      status: { 
        title: '状态', 
        type: 'dict-select',
        dict: {
          data: [
            { value: 1, label: '活跃', color: 'success' },
            { value: 2, label: '已删除', color: 'danger' }
          ]
        }
      },
      create_datetime: { title: '创建时间', type: 'datetime', column: { width: 180 } }
    }
  },
  {
    name: 'order',
    api: '/api/escort/order/',
    title: '订单',
    columns: {
      id: { title: 'ID', type: 'number', column: { width: 80 } },
      order_no: { title: '订单号', type: 'text', search: { show: true } },
      customer: { title: '客户', type: 'number' },
      service: { title: '服务项目', type: 'number' },
      total_amount: { 
        title: '总金额(元)', 
        type: 'number',
        column: { formatter: (row) => `¥${(row.total_amount / 100).toFixed(2)}` }
      },
      status: {
        title: '订单状态',
        type: 'dict-select',
        dict: {
          data: [
            { value: 0, label: '待支付', color: 'info' },
            { value: 1, label: '待接单', color: 'warning' },
            { value: 2, label: '已接单', color: 'primary' },
            { value: 3, label: '等待搭子', color: 'warning' },
            { value: 4, label: '服务中', color: 'processing' },
            { value: 5, label: '待确认', color: 'warning' },
            { value: 6, label: '已完成', color: 'success' },
            { value: 7, label: '已评价', color: 'default' },
            { value: 8, label: '已取消', color: 'danger' }
          ]
        }
      },
      create_datetime: { title: '创建时间', type: 'datetime', column: { width: 180 } }
    }
  },
  {
    name: 'review',
    api: '/api/escort/review/',
    title: '评价',
    columns: {
      id: { title: 'ID', type: 'number', column: { width: 80 } },
      order: { title: '订单', type: 'number' },
      customer: { title: '客户', type: 'number' },
      rating: { 
        title: '评分', 
        type: 'number',
        column: { formatter: (row) => `${row.rating}星` }
      },
      comment: { title: '评价内容', type: 'text' },
      create_datetime: { title: '评价时间', type: 'datetime', column: { width: 180 } }
    }
  },
  {
    name: 'service',
    api: '/api/escort/service/',
    title: '服务项目',
    columns: {
      id: { title: 'ID', type: 'number', column: { width: 80 } },
      name: { title: '服务名称', type: 'text', search: { show: true } },
      category: { title: '服务类别', type: 'number' },
      price: { 
        title: '价格(元)', 
        type: 'number',
        column: { formatter: (row) => `¥${(row.price / 100).toFixed(2)}` }
      },
      description: { title: '描述', type: 'text' },
      is_active: { 
        title: '是否启用', 
        type: 'dict-select',
        dict: {
          data: [
            { value: true, label: '启用', color: 'success' },
            { value: false, label: '禁用', color: 'danger' }
          ]
        }
      }
    }
  },
  {
    name: 'service_category',
    api: '/api/escort/service_category/',
    title: '服务类别',
    columns: {
      id: { title: 'ID', type: 'number', column: { width: 80 } },
      name: { title: '类别名称', type: 'text', search: { show: true } },
      description: { title: '描述', type: 'text' },
      sort_order: { title: '排序', type: 'number' },
      is_active: { 
        title: '是否启用', 
        type: 'dict-select',
        dict: {
          data: [
            { value: true, label: '启用', color: 'success' },
            { value: false, label: '禁用', color: 'danger' }
          ]
        }
      }
    }
  },
  {
    name: 'user',
    api: '/api/escort/escort_user/',
    title: '小程序用户',
    columns: {
      id: { title: 'ID', type: 'number', column: { width: 80 } },
      openid: { title: '微信OpenID', type: 'text', search: { show: true } },
      nickname: { title: '昵称', type: 'text', search: { show: true } },
      avatar: { 
        title: '头像', 
        type: 'image',
        column: { component: { name: 'fs-images-format' } }
      },
      phone: { title: '手机号', type: 'text' },
      hunter_status: {
        title: '打手状态',
        type: 'dict-select',
        dict: {
          data: [
            { value: 0, label: '未申请', color: 'info' },
            { value: 1, label: '审核中', color: 'warning' },
            { value: 2, label: '已通过', color: 'success' },
            { value: 3, label: '已拒绝', color: 'danger' },
            { value: 4, label: '已暂停', color: 'default' }
          ]
        }
      },
      balance: { 
        title: '余额(元)', 
        type: 'number',
        column: { formatter: (row) => `¥${(row.balance / 100).toFixed(2)}` }
      },
      total_income: { 
        title: '总收入(元)', 
        type: 'number',
        column: { formatter: (row) => `¥${(row.total_income / 100).toFixed(2)}` }
      },
      create_datetime: { title: '注册时间', type: 'datetime', column: { width: 180 } },
      update_datetime: { title: '更新时间', type: 'datetime', column: { width: 180 } }
    }
  },
  {
    name: 'withdrawal',
    api: '/api/escort/withdrawal/',
    title: '提现记录',
    columns: {
      id: { title: 'ID', type: 'number', column: { width: 80 } },
      hunter: { title: '打手', type: 'number' },
      amount: { 
        title: '提现金额(元)', 
        type: 'number',
        column: { formatter: (row) => `¥${(row.amount / 100).toFixed(2)}` }
      },
      tax_amount: { 
        title: '个税金额(元)', 
        type: 'number',
        column: { formatter: (row) => `¥${(row.tax_amount / 100).toFixed(2)}` }
      },
      actual_amount: { 
        title: '实际到账(元)', 
        type: 'number',
        column: { formatter: (row) => `¥${(row.actual_amount / 100).toFixed(2)}` }
      },
      status: {
        title: '提现状态',
        type: 'dict-select',
        dict: {
          data: [
            { value: 0, label: '申请中', color: 'info' },
            { value: 1, label: '处理中', color: 'warning' },
            { value: 2, label: '成功', color: 'success' },
            { value: 3, label: '失败', color: 'danger' }
          ]
        }
      },
      create_datetime: { title: '申请时间', type: 'datetime', column: { width: 180 } },
      update_datetime: { title: '处理时间', type: 'datetime', column: { width: 180 } }
    }
  }
];

// 生成crud.js文件内容
function generateCrudContent(module) {
  const columnsCode = Object.entries(module.columns)
    .map(([key, config]) => {
      const configStr = JSON.stringify(config, null, 2).replace(/"(\w+)":/g, '$1:');
      return `        ${key}: ${configStr}`;
    })
    .join(',\n');

  return `// 导入必要的工具
import { request } from '/@/utils/service';

// ${module.title}管理
export const createCrudOptions = function ({ expose }) {
  return {
    crudOptions: {
      request: {
        // 获取列表
        pageRequest: async ({ page, form, sort }) => {
          // 构建查询参数
          const params = {
            page: page.currentPage,
            limit: page.pageSize,
            ...form
          };
          
          // 处理排序参数
          if (sort && sort.prop && sort.order) {
            params.ordering = sort.order === 'ascending' ? sort.prop : \`-\${sort.prop}\`;
          }
          
          // 使用统一的request函数（会自动处理token）
          const response = await request({
            url: '${module.api}',
            method: 'get',
            params: params
          });
          
          // 转换API返回格式以匹配fast-crud的期望格式
          return {
            currentPage: response.data?.current_page || 1,
            pageSize: response.data?.page_size || 20,
            total: response.data?.count || 0,
            records: response.data?.results || []
          };
        },
        
        // 添加
        addRequest: async ({ form }) => {
          console.log('添加请求数据:', form);
          
          const response = await request({
            url: '${module.api}',
            method: 'post',
            data: form
          });
          
          return response.data || response;
        },
        
        // 编辑
        editRequest: async ({ form }) => {
          console.log('编辑请求数据:', form);
          
          const response = await request({
            url: \`${module.api}\${form.id}/\`,
            method: 'put',
            data: form
          });
          
          return response.data || response;
        },
        
        // 删除
        delRequest: async ({ row }) => {
          const response = await request({
            url: \`${module.api}\${row.id}/\`,
            method: 'delete',
            data: { id: row.id }
          });
          
          return response.data || response;
        }
      },
      
      // 列配置
      columns: {
${columnsCode}
      }
    }
  };
};`;
}

// 主函数
function main() {
  const webDir = 'D:/Users/Lenovo/.openclaw/workspace/admin-system/web';
  const escortDir = path.join(webDir, 'src/views/escort');
  
  console.log('开始修复陪玩平台模块...');
  
  modules.forEach(module => {
    const moduleDir = path.join(escortDir, module.name);
    const crudFile = path.join(moduleDir, 'crud.js');
    
    // 确保目录存在
    if (!fs.existsSync(moduleDir)) {
      fs.mkdirSync(moduleDir, { recursive: true });
      console.log(`创建目录: ${module.name}`);
    }
    
    // 生成并写入crud.js文件
    const content = generateCrudContent(module);
    fs.writeFileSync(crudFile, content, 'utf-8');
    
    console.log(`已修复: ${module.name}/crud.js`);
  });
  
  console.log(`\n已修复 ${modules.length} 个陪玩平台模块`);
  console.log('现在需要重启前端服务...');
}

// 执行
main();