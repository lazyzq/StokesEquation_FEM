function int_value = Gauss_quad_2D_trial_test(coe_fun,Gauss_weights,Gauss_nodes,vertices,basis_type_trial,basis_index_trial,basis_der_x_trial,basis_der_y_trial,basis_type_test,basis_index_test,basis_der_x_test,basis_der_y_test)
% trial & test both
xn1 = vertices(1,1);
xn2 = vertices(1,2);
xn3 = vertices(1,3);
yn1 = vertices(2,1);
yn2 = vertices(2,2);
yn3 = vertices(2,3);
Jn = (xn2-xn1)*(yn3-yn1)-(xn3-xn1)*(yn2-yn1);

Gpn = size(Gauss_nodes,2);
int_value = 0;
for k = 1:Gpn
    int_value = int_value +(Jn/2) *Gauss_weights(k)*feval(coe_fun,Gauss_nodes(1,k),Gauss_nodes(2,k))*local_basis_2D(Gauss_nodes(1,k),Gauss_nodes(2,k),vertices,basis_type_trial,basis_index_trial,basis_der_x_trial,basis_der_y_trial)*local_basis_2D(Gauss_nodes(1,k),Gauss_nodes(2,k),vertices,basis_type_test,basis_index_test,basis_der_x_test,basis_der_y_test);
end