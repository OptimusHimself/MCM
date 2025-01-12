import pandas as pd
import numpy as np
# 在Python中导入scipy库中的linalg模块
# scipy 是Python中的一个科学计算库。
# linalg 是线性代数（linear algebra）的缩写，它是数学的一个分支，涉及线性方程、线性函数以及它们通过矩阵和向量空间的表示。
from scipy import linalg

# 读取Excel文件的B:G列，除去第一行（标题）
df = pd.read_excel('棉花产量论文作业的数据.xlsx', usecols='C:G')
print(df)
# df.to_numpy 是 pandas 中 DataFrame 对象的一个方法，用于将 DataFrame 的数据转换为 NumPy 数组。
x = df.to_numpy()
print(x)
# 接下来的步骤与之前相同
# 标准化数据
X = (x - np.mean(x, axis=0)) / np.std(x, ddof=1, axis=0)

# 计算协方差矩阵
R = np.cov(X.T)

# 计算特征值和特征向量
eigenvalues, eigenvectors = linalg.eigh(R)
# 将特征值数组按降序排列
eigenvalues = eigenvalues[::-1]
# 将特征向量矩阵的列按降序排列
eigenvectors = eigenvectors[:, ::-1]

# 计算主成分贡献率和累积贡献率
contribution_rate = eigenvalues / sum(eigenvalues)
# np.cumsum 是 NumPy 库中的一个函数，用于计算数组元素的累积和。
cum_contribution_rate = np.cumsum(contribution_rate)

# 打印结果
print('特征值为：')
print(eigenvalues)
print('贡献率为：')
print(contribution_rate)
print('累计贡献率为：')
print(cum_contribution_rate)
print('与特征值对应的特征向量矩阵为：')
print(eigenvectors)
