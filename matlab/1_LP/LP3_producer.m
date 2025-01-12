%产地-销地问题
%导入数据
a = load("data1_5_1.txt"); %load之前，要检查表格数据
c = a(1:end-1,1:end-1);
e = a(1:end-1,end);% 2 dim; 产地产量
d = a(end,1:end-1);% 1 dim; 销地需求量
%基于问题的求解方法：optimproblem类
prob = optimproblem;
%决策向量：
x = optimvar('x',6,8,'LowerBound',0); %创建优化变量
%目标函数：
%prob.Objective = sum(sum(c.*x));
prob.Objective = sum(c.*x,'all');
%约束条件
prob.Constraints.con1 = sum(x,1) == d;
prob.Constraints.con2 = sum(x,2) <= e; %很神奇的语法，需要经验。

%Last Step: Use solve method:
[sol,fval,flag,out] = solve(prob);
disp(sol.x);

writematrix (sol.x,'result1.xlsx'); %可以自动帮你生成文件，不需要自己在文件夹下创建，很方便。
