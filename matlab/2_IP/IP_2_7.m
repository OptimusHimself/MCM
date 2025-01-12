a = load("data2_7.txt"); %load 函数会把输入的txt 转换为矩阵。所以，写这个txt的时候要精心设计。

% d = dist(a);

d = calculateDistanceMatrix(a');

prob =optimproblem;
n = 10;
x = optimvar('x',n,'Type','integer','LowerBound',0,'UpperBound',1);
y = optimvar('y',n,n,'Type','integer','LowerBound',0,'UpperBound',1);

prob.Objective = sum(x);
prob.Constraints.con1 = [1 <= sum(y)';sum(y,2) <= 5];
con2 = [];
con3 = [];

for i = 1:n
    con3 = [con3;x(i) == y(i,i)];
    for j = 1:n
        con2 = [con2;d(i,j)*y(i,j) <= 10*x(i);y(i,j) <= x(i)];
    end
end

prob.Constraints.con2 = con2;
porb.Constraints.con3 = con3;

[sol,fval,flag] = solve(prob);




