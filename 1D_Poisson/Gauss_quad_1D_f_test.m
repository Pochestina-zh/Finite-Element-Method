function intergral=Gauss_quad_1D_f_test(right_fun,Gauss_weight,Gauss_nodes,vertices,basis_type_test,basis_index_test,basis_der_x_test)

Gpn=length(Gauss_nodes);
intergral=0;

%% Gauss quadrature
for k=1:Gpn
   intergral=intergral+Gauss_weight(k)*feval(right_fun,Gauss_nodes(k))*FE_local_basis_fun_1D(Gauss_nodes(k),vertices,basis_type_test,basis_index_test,basis_der_x_test);
end