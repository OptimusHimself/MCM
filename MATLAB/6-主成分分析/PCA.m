clear;clc
 load data1.mat 
[n,p] = size(x);  % n是样本个数，p是指标个数

%% 第一步：对数据x标准化为X
X=zscore(x);   % matlab内置的标准化函数（x-mean(x)）/std(x)

%% 第二步：计算样本协方差矩阵
R = cov(X);


%% 第三步：计算R的特征值和特征向量
% 注意：R是半正定矩阵，所以其特征值不为负数
% R同时是对称矩阵，Matlab计算对称矩阵时，会将特征值按照从小到大排列哦
% eig函数的详解见第一讲层次分析法的视频
[V,D] = eig(R);  % V 特征向量矩阵  D 特征值构成的对角矩阵


%% 第四步：计算主成分贡献率和累计贡献率
lambda = diag(D);  % diag函数用于得到一个矩阵的主对角线元素值(返回的是列向量)
lambda = lambda(end:-1:1);  % 因为lambda向量是从小大到排序的，我们将其调个头
contribution_rate = lambda / sum(lambda);  % 计算贡献率
cum_contribution_rate = cumsum(lambda)/ sum(lambda);   % 计算累计贡献率  cumsum是求累加值的函数
disp('特征值为：')
disp(lambda')  % 转置为行向量，方便展示
disp('贡献率为：')
disp(contribution_rate')
disp('累计贡献率为：')
disp(cum_contribution_rate')
disp('与特征值对应的特征向量矩阵为：')
% 注意：这里的特征向量要和特征值一一对应，之前特征值相当于颠倒过来了，因此特征向量的各列需要颠倒过来
%  rot90函数可以使一个矩阵逆时针旋转90度，然后再转置，就可以实现将矩阵的列颠倒的效果
V=rot90(V)';
disp(V)


