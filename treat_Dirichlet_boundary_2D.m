function [A,b] = treat_Dirichlet_boundary_2D(A,b,boundarynodes,coe_fun,Pb_test)
nbn = size(boundarynodes,2);
% nbn:number of boundarynodes
for k = 1:nbn
    if boundarynodes(1,k) == -1
        i = boundarynodes(2,k);
        A(i,:) = 0;
        A(i,i) = 1;
        b(i) = feval(coe_fun,Pb_test(1,i),Pb_test(2,i));
    end
end