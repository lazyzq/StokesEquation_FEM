function [A,b] = treat_Dirichlet_boundary_2D_elastic(A,b,boundarynodes,coe_fun1,coe_fun2,Pb_test)
nbn = size(boundarynodes,2);
Nb = size(Pb_test,2);
% nbn:number of boundarynodes
for k = 1:nbn
    if boundarynodes(1,k) == -1
        i = boundarynodes(2,k);
        A(i,:) = 0;
        A(i,i) = 1;
        b(i) = feval(coe_fun1,Pb_test(1,i),Pb_test(2,i));
        A(Nb+i,:) = 0;
        A(Nb+i,Nb+i) = 1;
        b(Nb+i) = feval(coe_fun2,Pb_test(1,i),Pb_test(2,i));   
    end
end