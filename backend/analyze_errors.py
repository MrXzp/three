import re
from collections import Counter
import os
from datetime import datetime

error_file = "logs/error.log"
server_file = "logs/server.log"

def analyze_errors():
    print("=" * 60)
    print("三角洲俱乐部程序错误监控报告")
    print(f"检查时间: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    print("=" * 60)
    
    # 1. 检查后端错误日志文件
    print("\n1. 后端错误日志分析:")
    print("-" * 40)
    
    if not os.path.exists(error_file):
        print("错误日志文件不存在")
        return
    
    with open(error_file, "r", encoding="utf-8") as f:
        content = f.read()
    
    # 提取错误类型
    errors = []
    error_types = {
        r"no such table: (\w+)": "数据库表不存在",
        r"Error 10061 connecting to": "Redis连接失败",
        r"KeyError: '(\w+)'": "KeyError错误",
        r"Internal Server Error: (/\w+/.*)": "API内部错误",
        r"django.db.utils.OperationalError": "数据库操作错误",
        r"redis.exceptions.ConnectionError": "Redis连接异常"
    }
    
    for pattern, error_type in error_types.items():
        matches = re.findall(pattern, content)
        for match in matches:
            if match:
                errors.append(f"{error_type}: {match}")
            else:
                errors.append(error_type)
    
    # 统计错误数量
    error_counter = Counter(errors)
    print(f"总错误记录数: {len(content.split('ERROR')) - 1}")
    print("错误类型统计:")
    for error, count in error_counter.most_common():
        print(f"  {error}: {count}次")
    
    # 2. 检查数据库错误
    print("\n2. 数据库状态检查:")
    print("-" * 40)
    
    # 检查数据库文件
    db_file = "db.sqlite3"
    if os.path.exists(db_file):
        file_size = os.path.getsize(db_file)
        print(f"数据库文件存在: {db_file}")
        print(f"数据库文件大小: {file_size / 1024 / 1024:.2f} MB")
        
        # 检查关键表是否存在
        import sqlite3
        try:
            conn = sqlite3.connect(db_file)
            cursor = conn.cursor()
            
            critical_tables = [
                "dvadmin_system_config",
                "dvadmin_system_users", 
                "dvadmin_system_operation_log",
                "dvadmin_escort_order"
            ]
            
            print("关键表状态:")
            for table in critical_tables:
                cursor.execute(f"SELECT name FROM sqlite_master WHERE type='table' AND name='{table}';")
                result = cursor.fetchone()
                if result:
                    # 检查表是否有数据
                    cursor.execute(f"SELECT COUNT(*) FROM {table};")
                    count = cursor.fetchone()[0]
                    print(f"  ✓ {table}: 存在 ({count} 条记录)")
                else:
                    print(f"  ✗ {table}: 不存在")
            
            conn.close()
        except Exception as e:
            print(f"数据库检查错误: {e}")
    else:
        print(f"数据库文件不存在: {db_file}")
    
    # 3. 检查API错误响应
    print("\n3. API错误响应分析:")
    print("-" * 40)
    
    if os.path.exists(server_file):
        with open(server_file, "r", encoding="utf-8") as f:
            server_content = f.read()
        
        # 提取API错误
        api_errors = re.findall(r'HTTP (GET|POST|PUT|DELETE) (/\S+) (\d{3})', server_content)
        
        status_codes = {}
        for method, endpoint, code in api_errors:
            if code not in status_codes:
                status_codes[code] = []
            status_codes[code].append(f"{method} {endpoint}")
        
        print("API响应状态码统计:")
        for code in sorted(status_codes.keys()):
            count = len(status_codes[code])
            print(f"  HTTP {code}: {count}次")
            
            # 显示最常见的错误端点
            if code.startswith("4") or code.startswith("5"):
                endpoint_counter = Counter(status_codes[code])
                print(f"    常见错误端点:")
                for endpoint, ep_count in endpoint_counter.most_common(3):
                    print(f"      {endpoint}: {ep_count}次")
    
    # 4. 检查是否有新错误
    print("\n4. 新错误检测:")
    print("-" * 40)
    
    # 获取最近24小时的错误
    lines = content.split("\n")
    recent_lines = []
    for line in lines[-100:]:  # 检查最近100行
        if "ERROR" in line:
            recent_lines.append(line)
    
    if recent_lines:
        print(f"最近100行中的错误数量: {len(recent_lines)}")
        print("最近错误示例:")
        for line in recent_lines[:5]:
            # 提取时间戳和错误信息
            match = re.search(r'\[(\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2},\d{3})\]', line)
            if match:
                timestamp = match.group(1)
                error_msg = line[match.end():].strip()
                print(f"  {timestamp}: {error_msg[:100]}...")
    else:
        print("最近100行中没有发现新错误")
    
    # 5. 错误趋势分析
    print("\n5. 错误趋势分析:")
    print("-" * 40)
    
    # 按日期统计错误
    date_pattern = r'\[(\d{4}-\d{2}-\d{2}) \d{2}:\d{2}:\d{2},\d{3}\]'
    dates = re.findall(date_pattern, content)
    date_counter = Counter(dates)
    
    if date_counter:
        print("按日期错误统计:")
        for date in sorted(date_counter.keys()):
            print(f"  {date}: {date_counter[date]}次错误")
    else:
        print("未找到日期信息")
    
    print("\n" + "=" * 60)
    print("总结:")
    print("-" * 60)
    
    total_errors = len(content.split('ERROR')) - 1
    if total_errors == 0:
        print("✅ 系统运行正常，未发现错误")
    elif total_errors < 10:
        print(f"⚠️  系统有少量错误 ({total_errors}个)，建议关注")
    else:
        print(f"❌ 系统存在较多错误 ({total_errors}个)，需要立即处理")
        
    # 检查是否有严重错误
    severe_errors = [
        "no such table",
        "Internal Server Error",
        "ConnectionError",
        "OperationalError"
    ]
    
    severe_count = 0
    for error_type in severe_errors:
        if error_type in content:
            severe_count += content.count(error_type)
    
    if severe_count > 0:
        print(f"⚠️  发现 {severe_count} 个严重错误，需要立即处理")
    
    print("=" * 60)

if __name__ == "__main__":
    analyze_errors()