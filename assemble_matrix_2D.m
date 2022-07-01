function A = assemble_matrix_2D(coe_fun,Gauss_type,matrix_size,number_of_elements,P,T,Tb_trial,Tb_test,number_of_local_basis_fun_trial,number_of_local_basis_fun_test,basis_type_trial,r,s,basis_type_test,p,q)
A = zeros(matrix_size(1),matrix_size(2));
for n=1:number_of_elements
    % 获取第n各单元的顶点
    vertices=P(:,T(:,n));
    % vertices is a concept of mesh
    [Gauss_weights,Gauss_nodes] = generate_Gauss_local(vertices,Gauss_type);
    for alpha = 1:number_of_local_basis_fun_trial
        for beta = 1:number_of_local_basis_fun_test
            %int_value = Gauss_quad_2D_trial_test(coe_fun,Gauss_weights,Gauss_nodes,vertices,basis_type_trial,alpha,basis_der_x_trial,basis_type_test,beta,basis_der_x_test);
            int_value = Gauss_quad_2D_trial_test(coe_fun,Gauss_weights,Gauss_nodes,vertices,basis_type_trial,alpha,r,s,basis_type_test,beta,p,q);
            %   S(beta,alpha) = int_value;
            %i = Tb_test(beta,n);
            %j = Tb_trial(alpha,n);
            A(Tb_test(beta,n),Tb_trial(alpha,n)) = A(Tb_test(beta,n),Tb_trial(alpha,n)) + int_value;
        end
    end
end