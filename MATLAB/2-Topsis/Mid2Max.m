function [posit_x] = Mid2Max(x,best)
    M = max(abs(x-best));
    posit_x = 1 - abs(x-best) / M;
end

% % 注意：代码文件仅供参考，一定不要直接用于自己的数模论文中
