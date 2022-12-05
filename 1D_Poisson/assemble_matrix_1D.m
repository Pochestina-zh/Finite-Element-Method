function A=assemble_matrix_1D(coe_fun,P,T,Pb_trial,Tb_trial,Pb_test,Tb_test,basis_type_trial,basis_der_x_trial,Nlb_trial,basis_type_test,basis_der_x_test,Nlb_test,Gauss_quad_type)
% coe_fun is the coefficitent of the elliptic equation

%% initial variable
number_elements=size(T,2);  % number of mesh elements

matrix_size=[size(Pb_test,2),size(Pb_trial,2)];     % size of the stiffness matrix

A=sparse(matrix_size(1),matrix_size(2));

%% assemble the stiffness matrix
for n=1:number_elements
    
    vertices=P(:,T(:,n));   % coordinates of the vertices on the n-th elements
    [Gauss_weight,Gauss_nodes]=generate_Gauss_local_1D(vertices,Gauss_quad_type);   % generate Gauss weights & Gauss nodes on the n-th elements
    
   for alpha=1:Nlb_trial
       
       for beta=1:Nlb_test
           
           int_value=Gauss_quad_1D_trial_test(coe_fun,Gauss_weight,Gauss_nodes,vertices,basis_type_trial,alpha,basis_der_x_trial,basis_type_test,beta,basis_der_x_test);
           
           A(Tb_test(beta,n),Tb_trial(alpha,n))=A(Tb_test(beta,n),Tb_trial(alpha,n))+int_value;
           
       end
       
   end
    
end
