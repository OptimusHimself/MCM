% 蒙特卡洛法

n = 10^4;

x = unifrnd(0,12,[1,n]);
y = unifrnd(0,9,[1,n]);

pinshu = sum(y<x.^2 & x<=3) + sum(y<12-x & x>=3);

area_appr = 12*9*pinshu/n; %49.5026  49.4778  标答：49.5