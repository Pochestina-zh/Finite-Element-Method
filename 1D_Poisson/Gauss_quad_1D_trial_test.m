function int_value=Gauss_quad_1D_trial_test(coe_fun,Gauss_weight,Gauss_nodes,vertices,basis_type_trial,basis_index_trial,basis_der_x_trial,basis_type_test,basis_index_test,basis_der_x_test)

Gpn=size(Gauss_nodes);
int_value=0;

%% Gauss quadrature
for k=1:Gpn
   int_value=int_value+Gauss_weight(k)*feval(coe_fun,Gauss_nodes(k))*FE_local_basis_fun_1D(Gauss_nodes(k),vertices,basis_type_trial,basis_index_trial,basis_der_x_trial)*FE_local_basis_fun_1D(Gauss_nodes(k),vertices,basis_type_test,basis_index_test,basis_der_x_test); 
end
