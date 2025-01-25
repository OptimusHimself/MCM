% shang.m -- 一套框架。用来带入数据
clc;clear;
%指标正向化处理后数据为data1
data1=data;  %无法识别变量? what?!
%%越小越优型处理
index=[3,4];%越小越优指标位置,即第3和4列为越小越优型指标
for i=1:length(index)
  data1(:,index(i))=max(data(:,index(i)))-data(:,index(i));
end
%%某点最优型指标处理
index=[5];%第五列为某点最优型
a=90;%最优型数值
for i=1:length(index)
  data1(:,index(i))=1-abs(data(:,index(i))-a)/max(abs(data(:,index(i))-a));
end
 
%数据标准化 mapminmax对行进行标准化，所以转置一下
data2=mapminmax(data1',0.002,1); %标准化到0.002-1区间
data2=data2';
 
%得到信息熵
[m,n]=size(data2);
p=zeros(m,n);
for j=1:n
    p(:,j)=data2(:,j)/sum(data2(:,j));
end
for j=1:n
   E(j)=-1/log(m)*sum(p(:,j).*log(p(:,j)));
end
 
%计算权重
w=(1-E)/sum(1-E);
 
%计算得分
s=data2*w';
Score=100*s/max(s);
disp('12个银行分别得分为：')
disp(Score)

