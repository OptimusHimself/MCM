import numpy as np

# 请输入初始矩阵[[55, 24, 10], [65, 38, 22], [75, 40, 18], [100, 50, 20]]
A = np.array(eval(input('请输入初始矩阵=')))  # 假设输入的形式是合法的Python列表形式

# 求出每一列的均值以供后续的数据预处理
Mean = np.mean(A, axis=0)

# 预处理后的矩阵
A_norm = A / Mean

print('预处理后的矩阵为：')
print(A_norm)

# 母序列
Y = A_norm[:, 0]

# 子序列
X = A_norm[:, 1:]

# 计算|X0-Xi|矩阵(在这里我们把X0定义为了Y)
absX0_Xi = np.abs(X - np.tile(Y.reshape(-1, 1), (1, X.shape[1])))

# 计算两级最小差a
a = np.min(absX0_Xi)

# 计算两级最大差b
b = np.max(absX0_Xi)

# 分辨系数取0.5
rho = 0.5

# 计算子序列中各个指标与母序列的关联系数
gamma = (a + rho * b) / (absX0_Xi + rho * b)

print('子序列中各个指标的灰色关联度分别为：')
print(np.mean(gamma, axis=0))
