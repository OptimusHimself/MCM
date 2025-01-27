import pandas as pd

# 数据
years = list(range(2015, 2025))
pm25 = [21.67, 20, 24.17, 17.5, 16.67, 20.83, 18.99, 20.19, 23.12, 20.98]
co2 = [398.5, 400.2, 402.8, 405.1, 407.6, 410.3, 412.5, 414.8, 417.2, 419.5]

# 创建DataFrame
data = {
    'Year': years,
    'PM2.5': pm25,
    'CO2': co2
}

df = pd.DataFrame(data)

# 写入Excel文件
df.to_excel('environment_data.xlsx', index=False)

print("数据已成功写入Excel文件 'environment_data.xlsx'")