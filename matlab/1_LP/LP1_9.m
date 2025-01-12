%1998 A
%定义问题，定义目标：求最大值
prob = optimproblem("ObjectiveSense","max");

%定义净收益率、优化变量、目标函数
x = optimvar('x',5,'LowerBound',0);
c = [0.05,0.27,0.19,0.185,0.185];%净收益率  
prob.Objective = c*x;  %最开始c 和 x 维度搞错了。matlab报错也没看出来。

M = 10000;% M 总投资额 就随便设一个

%定义第一个约束条件：相等约束
p = [1,1.01,1.02,1.045,1.065];
prob.Constraints.con1 = p*x == M;

% 定义风险损失率 & 第二个约束条件：小于约束
q = [0.025,0.015,0.055,0.026]; %风险损失率。

a = 0;
aa = [];
QQ = [];
XX = [];
hold on;
while a<0.05 
    prob.Constraints.con2 = q.*x(2:end)' <= a*M; %每个分量乘积小于风险上限
    [sol,Q,flag,out] = solve(prob);
    aa = [aa;a];
    QQ = [QQ,Q];
    XX = [XX;sol.x']
    a = a + 0.001;

end

plot(aa,QQ',"*k");
xlabel('$a$','Interpreter','latex');
ylabel('$Q$',"Interpreter","latex",'Rotation',0);