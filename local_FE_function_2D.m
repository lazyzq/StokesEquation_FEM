function result = local_FE_function_2D(Tb_trial_n,solution,vertices,x,y,basis_type,basis_der_x,basis_der_y)
result = 0;
number_of_local_basis = size(Tb_trial_n,1);
for k = 1:number_of_local_basis
    result = result + solution(Tb_trial_n(k))*local_basis_2D(x,y,vertices,basis_type,k,basis_der_x,basis_der_y);
end
