a = [0.1,5,5000,4.7;
    0.2,6,6000,5.6;
    0.4,7,7000,6.7;
    0.9,10,10000,2.3;
    1.2,2,400,1.8];

% y = zscore(a);

[m,n] = size(a);
%定义符号函数，规范化（预处理）区间类属性
x2 = @(qujian,lb,ub,x)(1-(qujian(1)-x)./qujian(1)-lb).*...
    (x>=lb & x<qujian(1)) + (x>= qujian(1) & x<=qujian(2))+...
    (1-(x-qujian(2))./(ub-qujian(2))).*(x>qujian(2)&x<=ub);

qujian = [5,6];
lb = 2;%lowerbound 不可接受下界
ub = 12; %upperbound 不可接受上界

a(:,2) = x2(qujian,lb,ub,a(:,2));
b = a./vecnorm(a); %矩阵广播 进行向量规范化 vector normalization
w = [0.2,0.3,0.4,0.1];

c = b.*w; %矩阵广播求加权矩阵。 说真的，我不喜欢这类emparical的语法。
Cstar = max(c); %正理想解  这语法也是绝。
Cstar(4) = min(c(:,4)); %属性4是成本型的。 而vector normalization预处理方法无法做到一致性
C0 = min(c); %负理想解
C0(4) = max(c(:,4));
Sstar = vecnorm(c-Cstar,2,2);  %逐行计算方案距正理想解的距离
S0 = vecnorm(c-C0,2,2); %逐行计算方案距正理想解的距离
f = S0./(Sstar+S0); % 排序指标
[f_sorted,index] = sort(f,'descend');  %求排序结果




