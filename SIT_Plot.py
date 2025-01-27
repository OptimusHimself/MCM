import pandas as pd

# 年份范围
years = list(range(2014, 2024))

# 图中提取的SIT指数
sit_indices = [0.6248, 0.6499, 0.5333, 0.5898, 0.6197, 0.6001, 0.6760, 0.6277, 0.5913, 0.6423]

# 创建DataFrame
df = pd.DataFrame({
    '年份': years,
    'SIT指数': sit_indices
})

# 将DataFrame保存为Excel文件
df.to_excel('sit_indices.xlsx', index=False)

print("Excel文件已生成，文件名为'sit_indices.xlsx'")