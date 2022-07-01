[solu,err,A,b]=FE_solver_2D_Poisson([-1,-1],[1,1],1/8,1/8,202,202,1);
% infinite norm check linear 2D triangle
[~,err,~,~]=FE_solver_2D_Poisson([-1,-1],[1,1],1/8,1/8,201,201,1);
% h = 1/8 err = 0.017807637978564
[~,err,~,~]=FE_solver_2D_Poisson([-1,-1],[1,1],1/16,1/16,201,201,1);
% h = 1/16 err = 0.004809654660503
[~,err,~,~]=FE_solver_2D_Poisson([-1,-1],[1,1],1/32,1/32,201,201,1);
% h = 1/32 err = 0.001249727561496
[~,err,~,~]=FE_solver_2D_Poisson([-1,-1],[1,1],1/64,1/64,201,201,1);
% h = 1/64 err = 3.185153493690876e-04
[~,err,~,~]=FE_solver_2D_Poisson([-1,-1],[1,1],1/128,1/128,201,201,1);
% h = 1/128 err = 8.040007169879057e-05
% infinite norm check quadratic 2D triangle
[~,err,~,~]=FE_solver_2D_Poisson([-1,-1],[1,1],1/8,1/8,202,202,1);
% h = 1/8 err = 3.437232225098619e-04
[~,err,~,~]=FE_solver_2D_Poisson([-1,-1],[1,1],1/16,1/16,202,202,1);
% h = 1/16 err = 4.575246261772498e-05

clear;clc;
format shortE
[err_nodeMax,err_infinite,err_L0,err_L1]=FE_solver_2D_Poisson([-1,-1],[1,1],1/8,1/8,202,202,1)

clear;clc;
format shortE
[err_nodeMax,err_infinite,err_L0,err_L1]=FE_solver_2D_Poisson([-1,-1],[1,1],1/8,1/8,201,201,1)
err = [err_nodeMax,err_infinite,err_L0,err_L1]




