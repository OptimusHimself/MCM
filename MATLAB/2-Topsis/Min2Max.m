function [posit_x] = Min2Max(x)
    posit_x = max(x) - x;
     %posit_x = 1 ./ x;    %如果x全部都大于0，也可以这样正向化
end


% % 注意：代码文件仅供参考，一定不要直接用于自己的数模论文中
