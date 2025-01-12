% 《尝试》 目标函数不是数学标准型

prob = optimproblem;

M = 10000;
r = [0.05,0.28,0.21,0.23,0.25]; % gain benefit
q = [0,0.025,0.015,0.055,0.026]; % risk
p = [0,0.01,0.02,0.045,0.065]; % payment

z = optimvar('z', 'LowerBound', 0);  % 辅助变量 z
x = optimvar('x',5,'LowerBound',0);

prob.Constraints.maximum = [q'.*x] <= z;
prob.Constraints.con1 = (1+p)*x == M; 

k = 0;
V = []; %风险初始化
Q = []; %收益初始化
X = []; %存储最优解

while k < 0.4
    prob.Constraints.con2 = (r-p)*x >= k*M;  %净收益 > M*k
    prob.Objective = z;
    [sol,fval,flag,out] = solve(prob);
    xx = sol.x;
    V = [V,max(q'.*xx)];
    X = [X;xx];
    Q = [Q,(r-p)*xx];

    k = k + 0.02;
end

plot(V,Q,'*-');
xlabel('risk');
ylabel('benefit');

