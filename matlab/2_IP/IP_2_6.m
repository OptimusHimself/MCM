%不是所有的整数规划都是0-1规划

prob = optimproblem;
c = load("data2_6.txt");  %默认把c当作表格？ 他怎么知道txt里面的数据是表格?

x = optimvar('x',4,5,'Type','integer','LowerBound',0,'UpperBound',1);
prob.Objective = sum(c.*x,"all");

prob.Constraints.con1 = sum(x,1) == 1;
prob.Constraints.con2 = sum(x,2) <= 2;

[sol,fval,flag] = solve(prob);

%最少装修费用：63.8 (万元)
