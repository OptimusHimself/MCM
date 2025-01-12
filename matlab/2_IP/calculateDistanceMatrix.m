function distMatrix = calculateDistanceMatrix(coords)
    % calculateDistanceMatrix - 计算二维坐标点之间的两两欧几里得距离
    %
    % 输入:
    %   coords: 一个 n x 2 矩阵，每行表示一个点的 (x, y) 坐标
    % 输出:
    %   distMatrix: 一个 n x n 的矩阵，表示点之间的两两距离
    
    % 确保输入是一个二维矩阵
    if size(coords, 2) ~= 2
        error('输入矩阵必须是 n x 2 的格式，表示每个点的 (x, y) 坐标。');
    end
    
    % 获取点的数量
    numPoints = size(coords, 1);
    
    % 初始化距离矩阵
    distMatrix = zeros(numPoints, numPoints);
    
    % 计算两两点之间的距离
    for i = 1:numPoints
        for j = 1:numPoints
            % 计算欧几里得距离
            distMatrix(i, j) = sqrt((coords(i, 1) - coords(j, 1))^2 + ...
                                    (coords(i, 2) - coords(j, 2))^2);
        end
    end
end
