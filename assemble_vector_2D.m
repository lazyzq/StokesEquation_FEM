function b = assemble_vector_2D(coe_fun,Gauss_type,matrix_size,number_of_elements,P,T,Tb_test,number_of_local_basis_fun_test,basis_type_test,p,q)
b = zeros(matrix_size(1),1);
for n = 1:number_of_elements
    vertices=P(:,T(:,n));
    [Gauss_weights,Gauss_node] = generate_Gauss_local(vertices,Gauss_type);
    for beta = 1:number_of_local_basis_fun_test
        int_value = Gauss_quad_2D_fun_test(coe_fun,Gauss_weights,Gauss_node,vertices,basis_type_test,beta,p,q);
        b(Tb_test(beta,n),1)=b(Tb_test(beta,n),1)+int_value;
    end
end