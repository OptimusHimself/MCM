%绝对值 转换为线性规划模型

%定义问题类型：求最小值
prob = optimproblem;

%定义优化变量（决策向量）
u = optimvar('u',4,'LowerBound',0);
v = optimvar('v',4,'LowerBound',0);

%定义约束矩阵、价值向量、常数向量、目标函数
a = [1,-12,-19,1;
    1,-1,11,-3;
    1,-12,-2,3];
c = [1;2;58;4];
b = [2;10;1/2];
prob.Objective = sum(c'*(u+v));%objective not objectiveness (

%定义约束方程组
prob.Constraints.con = a * (u-v) <= b;  %constraint not constrain(sad

%Let's cook!
[sol,fval,flag,out] = solve(prob);

%x = u+v;
x = sol.u - sol.v ;