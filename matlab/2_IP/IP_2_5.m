% 配备工人问题

prob = optimproblem;

x = optimvar('x',6,"Type",'integer','LowerBound',0);

prob.Objective = sum(x);

con = optimconstr(6); %初始化一组约束表达式 （bool）

a = [35,20,50,45,55,30];

con(1) = x(1) + x(6) >= a(1);
for i = 1:5
    con(i+1) = x(i) + x(i+1) >= a(i+1);
end

prob.Constraints.con = con;

[sol,favl,flag] = solve(prob);


% sum(sol.x) = 140;



