clc, clear
a=[9.5  18.2  12.0  10.2  18.2
21.1  18.2  12.0  9.5  10.2
21.1  10.2  10.2  12.0  10.2
18.2  12.0  9.5  18.2  10.2
21.1  12.0  18.2  12.0  18.2
10.2  10.2  9.5  21.1  10.2
9.5  21.1  12.0  10.2  12.0
10.2  18.2  10.2  21.1  21.1
10.2  10.2  18.2  18.2  18.2
18.2  10.2  18.2  10.2  10.2];
zw=quantile(a',0.5) %求矩阵a每一行的中位数
bzc=std(zw)  %计算中位数标准差的Bootstrap估计

