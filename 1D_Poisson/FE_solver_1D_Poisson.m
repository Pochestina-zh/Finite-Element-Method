function solution=FE_solver_1D_Poisson(left,right,left_type,right_type,h_partition,basis_type_trial,basis_type_test,Gauss_quad_type)
%% variable description
% These are the variabe given by users, we make some descriptions about how
% to choose the variable.

% boundary:
% left,right are the boundary of the 1D Poisson equation
% left\right_type==-1: Dirichlet condition
% left\right_type==-2: Neumann condition
% left\right_type==-3: Robin condition

% partition:
% h_partition is the given length\partition of the interval

% basis:
% basis_type_trial\test==101: 1D linear
% basis_type_trial\test==102: 1D quadratic

% Numerical quadrature:
% Gauss_quad_type==1: 2-points Gauss quadrature
% Gauss_quad_type==2: 4-points Gauss quadrature
% Gauss_quad_type==3: 8-points Gauss quadrature

%% FEM_sovler
% mesh and FEM_mesh generate
[P,T,Pb_trial,Tb_trial,Pb_test,Tb_test,Nlb_trial,Nlb_test]=generate_PT(left,right,h_partition,basis_type_trial,basis_type_test); 

% boundary generate
boundarynodes=generate_boundarynodes(Tb_trial,left_type,right_type);


% matrix assemble
basis_der_x_trial=1;
basis_der_x_test=1;

A=assemble_matrix_1D('function_c',P,T,Pb_trial,Tb_trial,Pb_test,Tb_test,basis_type_trial,basis_der_x_trial,Nlb_trial,basis_type_test,basis_der_x_test,Nlb_test,Gauss_quad_type);


% vector assemble
b=assemble_vector_1D('function_f',P,T,Pb_test,Tb_test,basis_type_test,basis_der_x_test,Nlb_test,Gauss_quad_type);


% boundary treatment
[A,b]=treat_Dirichlet_boundary('function_g',boundarynodes,A,b,Pb_trial);


% solution of linear system
solution=A\b;


% error of FEM
absolute_error=maximum_error_FE_nodes('exact_solution',solution,Pb_trial)

