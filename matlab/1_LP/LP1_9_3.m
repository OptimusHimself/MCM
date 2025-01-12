M = 10000;
prob = optimproblem;

x = optimvar('x_',6,1,'LowerBound',0);

r = [0.05,0.28,0.21,0.23,0.25];%收益率 length = 5

p = [0,0.01,0.02,0.045,0.065];%费率 length = 5

q = [0,0.025,0.015,0.055,0.026]'; %risk 转置

%W = 0:0.1:1

w = [0.766,0.767,0.810,0.811,0.824,0.825,0.962,0.963,1.0];

V = []; %风险初始化
Q = []; %收益初始化
X = []; %最优解初始化

prob.Constraints.con1 = (1+p)*x(1:end-1) == M;
prob.Constraints.con2 = q(2:end).*x(2:end-1) <= x(end); % x-end ??

for i = 1 : length(w)
    prob.Objective = w(i) * x(end) - (1-w(i))*(r-p)*x(1:end-1);
    [sol,fval,flag,out] = solve(prob);
    xx = sol.x_;
    V = [V,max(q.*xx(1:end-1))];
    Q = [Q,(r-p)*xx(1:end-1)];
    X = [X;xx'];
    
end

plot(V,Q,'*-');
    xlabel('风险/元');
    ylabel('收益/元');

% 我始终没有弄明白这个 w 的含义： W = 1意味着什么？ w大意味着什么? w越小又怎么了。 

