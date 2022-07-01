function error = compute_Hrs_error_2D(P,T,Tb_trial,solution,number_of_elements,Gauss_type,coe_fun,basis_type,r,s)
error = 0;
%rn = zeros(number_of_elements,1);
for n = 1:number_of_elements
    vertices = P(:,T(:,n));
    % 计算雅可比
    xn1 = vertices(1,1);
    xn2 = vertices(1,2);
    xn3 = vertices(1,3);
    yn1 = vertices(2,1);
    yn2 = vertices(2,2);
    yn3 = vertices(2,3);
    Jn = (xn2-xn1)*(yn3-yn1)-(xn3-xn1)*(yn2-yn1);
    % 结束计算雅可比
    Tb_trial_n = Tb_trial(:,n);
    %获取第n各单元的有限元节点编号
    [Gauss_weights, Gauss_points] = generate_Gauss_local(vertices,Gauss_type);
    number_of_GaussPoint = size(Gauss_points,2);
    % rn_Gp = zeros(number_of_GaussPoint,1);
    Gauss_int = 0;  % 初始化第n各单元高斯积分值
    for ng =  1:number_of_GaussPoint
        % rn_Gp(ng) = feval(coe_fun,Gauss_points(1,ng),Gauss_points(2,ng))-local_FE_function_2D(Tb_trial_n,solution,vertices,Gauss_points(1,ng),Gauss_points(2,ng),basis_type,0,0);
        Gauss_int = Gauss_int + (Jn/2)*Gauss_weights(ng)*(feval(coe_fun,Gauss_points(1,ng),Gauss_points(2,ng),r,s)-local_FE_function_2D(Tb_trial_n,solution,vertices,Gauss_points(1,ng),Gauss_points(2,ng),basis_type,r,s))^2;
    end
    error = error + Gauss_int;
end
% error = sqrt(error);
