%二级模糊综合评价：

a = load("data14_3.txt");

w = [0.4,0.3,0.2,0.1];
w1 = [0.2,0.3,0.3,0.2];
w2 = [0.3,0.2,0.1,0.2,0.2];
w3 = [0.1,0.2,0.3,0.2,0.2];
w4 = [0.3,0.2,0.2,0.3];

b = zeros(4,5);  %建议这里初始化一下

b(1,:) = w1 * a(1:4,:);  %傻逼matlab说左侧的大小是1*4，我都没定义....
b(2,:) = w2 * a(5:9,:);
b(3,:) = w3 * a(10:14,:);
b(4,:) = w4 * a(15:18,:);

c = w * b;

[c_sort,index] = sort(c,"descend");
