clear;clc
%%  1.�ж��Ƿ���Ҫ����
% A=[9,10,175,120;8,7,164,80;6,3,157,90]
X=input('ָ�����A=');    %%�����жϾ���
[n,m] = size(X);
disp(['����' num2str(n) '�����۶���, ' num2str(m) '������ָ��']) 
Judge = input(['��' num2str(m) '��ָ���Ƿ���Ҫ�������򻯴�������Ҫ������1 ������Ҫ����0��  ']);

if Judge == 1
    Position = input('��������Ҫ���򻯴�����ָ�����ڵ��У������2��3��6������Ҫ��������ô����Ҫ����[2,3,6]�� '); %[2,3,4]
    disp('��������Ҫ��������Щ�е�ָ�����ͣ�1����С�ͣ� 2���м��ͣ� 3�������ͣ� ')
    Type = input('���磺��2���Ǽ�С�ͣ���3���������ͣ���6�����м��ͣ�������[1,3,2]��  '); %[1,2,3]
    % ע�⣬Position��Type������ͬά�ȵ�������
    for i = 1 : size(Position,2)  %������Ҫ����Щ�зֱ��������������Ҫ֪��һ��Ҫ�����Ĵ�������
        % ѭ���Ĵ���
        X(:,Position(i)) = Positivization(X(:,Position(i)),Type(i),Position(i));
    % Positivization�������Լ�����ĺ������������ǽ������򻯣���һ��������������
    % ��һ��������Ҫ���򻯴�������һ������ X(:,Position(i))   �ع���һ����֪ʶ��X(:,n)��ʾȡ��n�е�ȫ��Ԫ��
    % �ڶ��������Ƕ�Ӧ����һ�е�ָ�����ͣ�1����С�ͣ� 2���м��ͣ� 3�������ͣ�
    % �����������Ǹ��ߺ����������ڴ�������ԭʼ�����е���һ��
    % �ú�����һ������ֵ������������֮���ָ�꣬���ǿ��Խ���ֱ�Ӹ�ֵ������ԭʼҪ��������һ������
    end
    disp('���򻯺�ľ��� X = ')
    disp(X)
end

%% 2.�����򻯺�ľ�����б�׼��
Z = X ./ repmat(sum(X.*X) .^ 0.5, n, 1);
disp('��׼������ Z = ')
disp(Z)

%% 3.���������ֵ�ľ������Сֵ�ľ��룬������÷�
D_P = sum([(Z - repmat(max(Z),n,1)) .^ 2 ],2) .^ 0.5;   % D+ �����ֵ�ľ�������
D_N = sum([(Z - repmat(min(Z),n,1)) .^ 2 ],2) .^ 0.5;   % D- ����Сֵ�ľ�������
S = D_N ./ (D_P+D_N);    % δ��һ���ĵ÷�
disp('���ĵ÷�Ϊ��')
stand_S = 100*S / sum(S)
[sorted_S,index] = sort(stand_S ,'descend')

% sort(A)��A�������������л�����������Ĭ�϶��Ƕ�A�����������С�sort(A)��Ĭ�ϵ����򣬶�sort(A,'descend')�ǽ�������
% sort(A)��A�Ǿ���Ĭ�϶�A�ĸ��н�����������
% sort(A,dim)
% dim=1ʱ��Чsort(A)
% dim=2ʱ��ʾ��A�еĸ���Ԫ����������
% A = [2,1,3,8]
% Matlab�и�һά����������ʹ��sort������sort��A���������ǰ�������еģ�����AΪ�������������
% ������������ǰ������������� [sA,index] = sort(A,'descend') �������sA������õ�������index������sA�ж�A��������
% sA  =  8     3     2     1
% index =  4     3     1     2