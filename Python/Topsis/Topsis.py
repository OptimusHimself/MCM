import numpy as np
#导入外部函数库，用于数学计算

print("请输入参评对象数目：")
n = int(input())

print("请输入指标数目：")
m = int(input())
#接收参评对象数目及指标数目。

print("请输入类型矩阵：1. 极大型；2. 极小型；3. 中间型；4. 区间型")
kind = input().split(" ")
#接收数据类型，将字符串转换为numpy矩阵。按其类型进行对应处理。

#接收用户发送的矩阵。
print("请输入矩阵数据：")

A = np.zeros(shape=(n,m))
#初始化一个全零矩阵，长度和宽度分别对应指标数量和参评对象个数。

for i in range(n):
    A[i] = input().split(" ") #单行数据
    A[i] = list(map(float, A[i])) #浮点数转换

print("输入矩阵为：\n{}".format(A))
#打印矩阵A。

# 极小型指标转换
def minTomax (maxx, x):
    x = list(x) # 输入指标转换为列表
    ans = [[(maxx - e)] for e in x] # 计算每个指标和最大值的相对差值，放入新列表中
    return np.array(ans) # 数据转换为numpy数组，返回。

# 中间型指标转换
def midTomax (bestx, x):
    x = list(x) # 输入指标数据转换为列表。
    h = [abs(bestx - e) for e in x] # 求解每一个数据和理想值的绝对差。
    M = max (h) # 找出所有的绝对差中的最大值，作为分母。
    if (M == 0): # 为避免绝对差最大值为0。
        M = 1    # 的情况所做的调整。
    # 此情况下，所有参评对象的该指标均处在理想值处，相互之间不存在差别。
    ans = [[(1-e/M)] for e in h]
    # 将每个数据对应转化为极大值类型评分。
    return np.array(ans)
    # 返回一个ans数组作为最终转换得出的极大值类型数据。

# 区间型指标转换
def regTomax (lowx, highx, x):
    x = list(x)
    M = max(lowx - min(x), max(x) - highx)
    if M == 0:
        M = 1 # 防止最大值为0的情况
    ans = []
    for i in range (len(x)):
        if x[i] < lowx:
            ans.append([(1-(lowx-x[i])/M)])
        elif x[i] > highx:
            ans.append([(1-(x[i]-highx)/M)])
        else:
            ans.append([1])
    return np.array(ans)

# 实现所有指标的正向化
X = np.zeros(shape = (n,1))

for i in range(m):
    if kind[i] == "1":
        v = np.array(A[:, i])
    elif kind[i] == "2":
        maxA = max(A[:, i])
        v = minTomax( maxA, A[:, i] )
    elif kind[i] == "3":
        print("类型三，请输入最优值：")
        bestA = eval(input())
        v = midTomax( bestA, A[:, i] )
    elif kind[i] == "4":
        print("类型四，请先输入区间最小值：")
        lowA = eval(input())
        print("请输入区间最大值：")
        highA = eval(input())
        v = regTomax( lowA, highA, A[:, i] )

    if i == 0:
        X = v.reshape(-1, 1)
    else:
        X = np.hstack([X, v.reshape(-1, 1)])
print("统一处理指标后的矩阵为：\n{}".format(X))

# 对统一后的矩阵X进行标准化处理
X = X.astype('float')
# 确保矩阵内元素为浮点数
for j in range(m):
    X[:, j] = X[:, j]/np.sqrt(sum(X[:, j]**2))
print("标准化矩阵为：\n{}".format(X))

x_max = np.max(X, axis = 0)
x_min = np.min(X, axis = 0)
d_z = np.sqrt(np.sum(np.square((X - np.tile(x_max, (n, 1)))), axis = 1))
d_f = np.sqrt(np.sum(np.square((X - np.tile(x_min, (n, 1)))), axis = 1))

print('每个指标的最大值：', x_max)
print('每个指标的最小值：', x_min)

print('d+向量：', d_z)
print('d-向量：', d_f)

s = d_f/(d_z+d_f)
Score = 100*s/sum(s)
for i in range(len(Score)):
    print(f"第{i+1}个标准化后的百分制得分为：{Score[i]}")