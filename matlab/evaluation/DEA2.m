% DEA2 use data14-5
m = 3;
n = 10;
s = 2;

d = load('data14_5_DEA2.txt');

a = d(:,1:3);
b = d(:,4:5);

prob = optimproblem("ObjectiveSense","max");
u = optimvar('u',m,LowerBound=0);
v = optimvar('v',s,LowerBound=0);

prob.Constraints.con1 = a*u >= b*v;

for j = 1:n
    fprintf('第%d年计算结果如下：\n',j + 1989);
    prob.Constraints.con2 = a(j,:)*u == 1;
    [sol,fval] = solve(prob);

end
