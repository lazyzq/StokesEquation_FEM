function [Gauss_weights, Gauss_points] = generate_Gauss_local(vertices,Gauss_type)
if Gauss_type == 1
    % 三角区域4高斯点
    % 三角区域高斯点
    % https://wenku.baidu.com/view/079880ac51e2524de518964bcf84b9d528ea2cad.html
    % 第n个单元的全局坐标
    A1 = vertices(:,1);
    A2 = vertices(:,2);
    A3 = vertices(:,3);
    % 参考单元上高斯点（4点）
    GPh = [1/3 3/5 1/5 1/5; 1/3 1/5 1/5 3/5];
    % 仿射变换生成局部高斯点
    Gauss_points = [A2-A1,A3-A1]*GPh+A1;
    Gauss_weights = [-27/48 25/48 25/48 25/48];   
end






