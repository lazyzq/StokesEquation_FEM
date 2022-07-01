clear;clc;
format shortE;
[err_nodeMax,err_infinite,err_L0,err_L1,err_nodeMaxp,err_infinitep,err_L0p,err_L1p] = FE_solver_2D_Stokes([0,-1/4],[1,0],1/8,1/8,202,201,1);
result1 = [err_nodeMax,err_infinite,err_L0,err_L1;err_nodeMaxp,err_infinitep,err_L0p,err_L1p];

% clear;clc;
format shortE;
[err_nodeMax,err_infinite,err_L0,err_L1,err_nodeMaxp,err_infinitep,err_L0p,err_L1p] = FE_solver_2D_Stokes([0,-1/4],[1,0],1/16,1/16,202,201,1);
result2 = [err_nodeMax,err_infinite,err_L0,err_L1;err_nodeMaxp,err_infinitep,err_L0p,err_L1p];

% clear;clc;
format shortE;
[err_nodeMax,err_infinite,err_L0,err_L1,err_nodeMaxp,err_infinitep,err_L0p,err_L1p] = FE_solver_2D_Stokes([0,-1/4],[1,0],1/32,1/32,202,201,1);
result3 = [err_nodeMax,err_infinite,err_L0,err_L1;err_nodeMaxp,err_infinitep,err_L0p,err_L1p];

% clear;clc;
format shortE;
[err_nodeMax,err_infinite,err_L0,err_L1,err_nodeMaxp,err_infinitep,err_L0p,err_L1p] = FE_solver_2D_Stokes([0,-1/4],[1,0],1/64,1/64,202,201,1);
result4 = [err_nodeMax,err_infinite,err_L0,err_L1;err_nodeMaxp,err_infinitep,err_L0p,err_L1p];

u_result = [result1(1,:);result2(1,:);result3(1,:);result4(1,:)]
p_result = [result1(2,:);result2(2,:);result3(2,:);result4(2,:)]



