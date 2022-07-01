function [err_nodeMax,err_infinite,err_L0,err_L1,err_nodeMaxp,err_infinitep,err_L0p,err_L1p] = FE_solver_2D_Stokes(left_bottom,right_top,h1,h2,basis_type_u,basis_type_p,Gauss_type)
% function [err_nodeMax,err_infinite,err_L0,err_L1] = FE_solver_2D_Elasticity(left_bottom,right_top,h1,h2,basis_type_trial,basis_type_test,Gauss_type)
% chapter 5 example 1
n1 = (right_top(1)-left_bottom(1))/h1;
n2 = (right_top(2)-left_bottom(2))/h2;
[P,T]=generate_Pb_Tb(left_bottom,right_top,n1,n2,201);
% basis_type_trial == 201:2D triangle linear element
% basis_type_trial == 202:2D triangle quadratic element
if basis_type_u == 201
    [Pb_u,Tb_u] = generate_Pb_Tb(left_bottom,right_top,n1,n2,201);
    number_of_local_basis_fun_u = 3;
elseif basis_type_u == 202
    [Pb_u,Tb_u] = generate_Pb_Tb(left_bottom,right_top,n1,n2,202);
    number_of_local_basis_fun_u = 6;
end
% basis_type_test == 201:2D triangle
% basis_type_test == 202:2D triangle
if basis_type_p == 201
    [Pb_p,Tb_p] = generate_Pb_Tb(left_bottom,right_top,n1,n2,201);
    number_of_local_basis_fun_p = 3;
elseif basis_type_p == 202
    [Pb_p,Tb_p] = generate_Pb_Tb(left_bottom,right_top,n1,n2,202);
    number_of_local_basis_fun_p = 6;

end
boundarynodes = generate_boundarynodes_2D(n1,n2,-1,basis_type_u);
% -1:迪利克雷边界条件 201:线性三角元 201:二次三角元
matrix_size_uu=[size(Pb_u,2),size(Pb_u,2)];
matrix_size_up = [size(Pb_u,2),size(Pb_p,2)];
matrix_size_pp = [size(Pb_p,2),size(Pb_p,2)];
number_of_elements=size(T,2);

A1 = assemble_matrix_2D('fun_nu',Gauss_type,matrix_size_uu,number_of_elements,P,T,Tb_u,Tb_u,number_of_local_basis_fun_u,number_of_local_basis_fun_u,basis_type_u,1,0,basis_type_u,1,0);
A2 = assemble_matrix_2D('fun_nu',Gauss_type,matrix_size_uu,number_of_elements,P,T,Tb_u,Tb_u,number_of_local_basis_fun_u,number_of_local_basis_fun_u,basis_type_u,0,1,basis_type_u,0,1);
A3 = assemble_matrix_2D('fun_nu',Gauss_type,matrix_size_uu,number_of_elements,P,T,Tb_u,Tb_u,number_of_local_basis_fun_u,number_of_local_basis_fun_u,basis_type_u,1,0,basis_type_u,0,1);
A5 = assemble_matrix_2D('fun_negone',Gauss_type,matrix_size_up,number_of_elements,P,T,Tb_p,Tb_u,number_of_local_basis_fun_p,number_of_local_basis_fun_u,basis_type_p,0,0,basis_type_u,1,0);
A6 = assemble_matrix_2D('fun_negone',Gauss_type,matrix_size_up,number_of_elements,P,T,Tb_p,Tb_u,number_of_local_basis_fun_p,number_of_local_basis_fun_u,basis_type_p,0,0,basis_type_u,0,1);
A0 = zeros(matrix_size_pp(1),matrix_size_pp(2));
A = [2*A1+A2 A3 A5;A3' 2*A2+A1 A6;A5' A6' A0];
b1 = assemble_vector_2D('fun_f1',Gauss_type,matrix_size_uu,number_of_elements,P,T,Tb_u,number_of_local_basis_fun_u,basis_type_u,0,0);
b2 = assemble_vector_2D('fun_f2',Gauss_type,matrix_size_uu,number_of_elements,P,T,Tb_u,number_of_local_basis_fun_u,basis_type_u,0,0);
b0 = zeros(size(Pb_p,2),1);
b = [b1;b2;b0];
[A,b] = treat_Dirichlet_boundary_2D_elastic(A,b,boundarynodes,'fun_u1','fun_u2',Pb_u);
nbu = size(Pb_u,2);
A(2*nbu+1,:) = 0;
A(2*nbu+1,2*nbu+1) = 1;
b(2*nbu+1) = 0;

solution = A\b;
std1 = generate_std_2D('fun_u1',Pb_u);
std2 = generate_std_2D('fun_u2',Pb_u);
stdp = generate_std_2D('fun_p',Pb_p);
std = [std1;std2];
err_nodeMax = max(abs(solution(1:2*nbu)-std));
err_nodeMaxp = max(abs(solution(2*nbu+1:end)-stdp));
solution1 = solution(1:nbu);
solution2 = solution(nbu+1:2*nbu);
solutionp = solution(2*nbu+1:end);
% 计算无穷范数 Compute infinite norm
err_infinite1 = compute_Linf_error_2D(P,T,Tb_u,solution1,number_of_elements,Gauss_type,'fun_u1',basis_type_u);
err_infinite2 = compute_Linf_error_2D(P,T,Tb_u,solution2,number_of_elements,Gauss_type,'fun_u2',basis_type_u);
err_infinite = max([err_infinite1;err_infinite2]);
err_infinitep = compute_Linf_error_2D(P,T,Tb_p,solutionp,number_of_elements,Gauss_type,'fun_p',basis_type_p);
% L0范
err_L0_1 = sqrt(compute_Hrs_error_2D(P,T,Tb_u,solution1,number_of_elements,Gauss_type,'fun_u1_der',basis_type_u,0,0));
err_L0_2 = sqrt(compute_Hrs_error_2D(P,T,Tb_u,solution2,number_of_elements,Gauss_type,'fun_u2_der',basis_type_u,0,0));
err_L0 = sqrt(err_L0_1^2+err_L0_2^2);
err_L0p = sqrt(compute_Hrs_error_2D(P,T,Tb_p,solutionp,number_of_elements,Gauss_type,'fun_p_der',basis_type_p,0,0));
%L1范
error_1 = compute_Hrs_error_2D(P,T,Tb_u,solution1,number_of_elements,Gauss_type,'fun_u1_der',basis_type_u,0,1);
error_2 = compute_Hrs_error_2D(P,T,Tb_u,solution1,number_of_elements,Gauss_type,'fun_u1_der',basis_type_u,1,0);
err_L1_1 = sqrt(error_1+error_2);
error_1 = compute_Hrs_error_2D(P,T,Tb_u,solution2,number_of_elements,Gauss_type,'fun_u2_der',basis_type_u,0,1);
error_2 = compute_Hrs_error_2D(P,T,Tb_u,solution2,number_of_elements,Gauss_type,'fun_u2_der',basis_type_u,1,0);
err_L1_2 = sqrt(error_1+error_2);
err_L1 = sqrt(err_L1_1^2+err_L1_2^2);
error_1 = compute_Hrs_error_2D(P,T,Tb_p,solutionp,number_of_elements,Gauss_type,'fun_p_der',basis_type_p,0,1);
error_2 = compute_Hrs_error_2D(P,T,Tb_p,solutionp,number_of_elements,Gauss_type,'fun_p_der',basis_type_p,1,0);
err_L1p = sqrt(error_1+error_2);






