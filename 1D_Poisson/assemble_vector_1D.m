function b=assemble_vector_1D(right_fun,P,T,Pb_test,Tb_test,basis_type_test,basis_der_x_test,Nlb_test,Gauss_quad_type)
%% intialize the variavle
number_element=size(T,2);  % the number of the mesh elements

vector_size=size(Pb_test,2);     % size of the load vector

b=sparse(vector_size,1);


%% assemble the load vector
for n=1:number_element

    vertices=P(:,T(:,n));   % coordinates of the vertices on the n-th element
    [Gauss_weight,Gauss_nodes]=generate_Gauss_local_1D(vertices,Gauss_quad_type);   % generate Gauss quadration weight and nodes on n-th element
    
        for beta=1:Nlb_test
            
            intergral=Gauss_quad_1D_f_test(right_fun,Gauss_weight,Gauss_nodes,vertices,basis_type_test,beta,basis_der_x_test);
            
            b(Tb_test(beta,n),1)=b(Tb_test(beta,n),1)+intergral;
            
        end
        
end

