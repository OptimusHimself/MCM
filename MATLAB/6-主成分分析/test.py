# # np.mean 是 NumPy 库中的一个函数，用于计算数组或数组的元素的平均值。
# # 可以指定 axis 参数以计算指定轴上的平均值，这对于处理多维数组非常有用。
# # 创建一个二维数组
# import numpy as np
# arr_2d = np.array([[1, 2, 3], [4, 5, 6]])
#
# # 计算每列的平均值（沿着行的方向）
# column_means = np.mean(arr_2d, axis=0)
#
# # 打印每列的平均值
# print(column_means)


# # np.std 是 NumPy 库中的一个函数，用于计算数组或数组元素的标准差（standard deviation）
# # 也可以指定 axis 参数以计算指定轴上的标准差
# # 创建一个二维数组
# arr_2d = np.array([[1, 2, 3], [4, 5, 6]])
#
# # 计算每列的标准差（沿着行的方向）
# column_std_dev = np.std(arr_2d, axis=0)
#
# # 打印每列的标准差
# print(column_std_dev)


# # eigenvalues[::-1]：将特征值数组反转，使其按降序排列。
# # eigenvectors[:, ::-1]：将特征向量矩阵的列（每列对应一个特征向量）反转，使其与特征值的顺序对应。
# import numpy as np
#
# # 假设有一个特征值数组
# eigenvalues = np.array([3, 1, 4, 2])
#
# # 假设有一个特征向量矩阵，每列对应一个特征向量
# eigenvectors = np.array([[1, 0, 0, 1],
#                          [0, 1, 0, 1],
#                          [0, 0, 1, 1],
#                          [1, 1, 1, 1]])
# # 将特征值数组按降序排列
# eigenvalues = eigenvalues[::-1]
#
# # 将特征向量矩阵的列按降序排列
# # eigenvectors = eigenvectors[:, ::-1]


# # np.cumsum 是 NumPy 库中的一个函数，用于计算数组元素的累积和。
# import numpy as np
#
# # 创建一个二维数组
# arr_2d = np.array([[1, 2, 3], [4, 5, 6]])
#
# # 沿着行的方向计算累积和
# cumulative_sum_row = np.cumsum(arr_2d, axis=1)
#
# # 打印沿着行的方向的累积和
# print(cumulative_sum_row)
