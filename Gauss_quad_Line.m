function int_value = Gauss_quad_Line(curve_fun,integral_fun,vertices,Gauss_Pt_Line,Gauss_weights)    
% 功能：获取区间内高斯曲线积分值
% 输入：
% cureve_fun:积分路径函数(含一阶导)
% integral_fun:被积函数
% vertices:积分区间
% Gauss_Pt_Line:区间内高斯点
% Gauss_weights:高斯权重
% 输出：
% int_value:高斯积分值
int_value = 0;
% 初始化高斯积分值
nGp = size(Gauss_weights,2);
% 高斯点个数
for k = 1:nGp
    % 遍历高斯点求和
    int_value = int_value + abs((vertices(1,2)- vertices(1,1))/2)* ...
                Gauss_weights(k)*feval(integral_fun,Gauss_Pt_Line(1,k),Gauss_Pt_Line(2,k),0)* ...
                sqrt(1+(feval(curve_fun,Gauss_Pt_Line(1,k),Gauss_Pt_Line(2,k),1))^2);
 end