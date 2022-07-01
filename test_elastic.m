clear;clc;
format shortE
[err_nodeMax] = FE_solver_2D_Elasticity([0,0],[1,1],1/8,1/8,201,201,1)

clear;clc;
format shortE
[err_nodeMax,err_infinite] = FE_solver_2D_Elasticity([0,0],[1,1],1/8,1/8,201,201,1)

clear;clc;
format shortE
[err_nodeMax,err_infinite,err_L0] = FE_solver_2D_Elasticity([0,0],[1,1],1/8,1/8,201,201,1)

clear;clc;
format shortE
[err_nodeMax,err_infinite,err_L0,err_L1] = FE_solver_2D_Elasticity([0,0],[1,1],1/8,1/8,201,201,1)

clear;clc;
format shortE
[err_nodeMax,err_infinite,err_L0,err_L1] = FE_solver_2D_Elasticity([0,0],[1,1],1/16,1/16,201,201,1)

clear;clc;
format shortE
[err_nodeMax,err_infinite,err_L0,err_L1] = FE_solver_2D_Elasticity([0,0],[1,1],1/32,1/32,201,201,1)

clear;clc;
format shortE
[err_nodeMax,err_infinite,err_L0,err_L1] = FE_solver_2D_Elasticity([0,0],[1,1],1/64,1/64,201,201,1)

clear;clc;
format shortE
[err_nodeMax,err_infinite,err_L0,err_L1] = FE_solver_2D_Elasticity([0,0],[1,1],1/8,1/8,202,202,1)
clear;clc;
format shortE
[err_nodeMax,err_infinite,err_L0,err_L1] = FE_solver_2D_Elasticity([0,0],[1,1],1/16,1/16,202,202,1)
clear;clc;
format shortE
[err_nodeMax,err_infinite,err_L0,err_L1] = FE_solver_2D_Elasticity([0,0],[1,1],1/32,1/32,202,202,1)
clear;clc;
format shortE
[err_nodeMax,err_infinite,err_L0,err_L1] = FE_solver_2D_Elasticity([0,0],[1,1],1/64,1/64,202,202,1)
