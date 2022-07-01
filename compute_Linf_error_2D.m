function error = compute_Linf_error_2D(P,T,Tb_trial,solution,number_of_elements,Gauss_type,coe_fun,basis_type)
% error = 0;
rn = zeros(number_of_elements,1);
for n = 1:number_of_elements
    vertices = P(:,T(:,n));
    
    Tb_trial_n = Tb_trial(:,n);
    %获取第n各单元的有限元节点编号
    [~, Gauss_points] = generate_Gauss_local(vertices,Gauss_type);
    number_of_GaussPoint = size(Gauss_points,2);
    rn_Gp = zeros(number_of_GaussPoint,1);
    for ng =  1:number_of_GaussPoint
        rn_Gp(ng) = abs(feval(coe_fun,Gauss_points(1,ng),Gauss_points(2,ng))-local_FE_function_2D(Tb_trial_n,solution,vertices,Gauss_points(1,ng),Gauss_points(2,ng),basis_type,0,0));
%         以下代码负责绘制高斯点有限元函数值
%         scatter3(Gauss_points(1,ng),Gauss_points(2,ng),local_FE_function_2D(Tb_trial_n,solution,vertices,Gauss_points(1,ng),Gauss_points(2,ng),basis_type,0,0));
%         hold on;
    end
    rn(n) = max(rn_Gp);
end
error = max(rn);



