function [P,T,Pb_trial,Tb_trial,Pb_test,Tb_test,Nlb_trial,Nlb_test]=generate_PT(left,right,h_partition,basis_type_trial,basis_type_test)
% generate the mesh and FEM mesh

%% P,T generate
number_elements=(right-left)/h_partition;    % the number of mesh elements

P=sparse(1,number_elements+1);   % coordinates of the mesh nodes
T=sparse(2,number_elements);    % global index of the nodes on mesh elements

P=linspace(left,right,number_elements+1);
T(1,:)=linspace(1,number_elements,number_elements);
T(2,:)=T(1,:)+1;

%%  Pb_trail\test,Tb_trial\test generate
%basis_type_trial\test==101: 1D linear
%basis_type_trial\test==102: 1D quadratic

if basis_type_trial==101
    
    Pb_trial=P;
    Tb_trial=T;
    Nlb_trial=2;
    
elseif basis_type_trial==102
    
    % ?;
    
end

if basis_type_test==101
    
    Pb_test=P;
    Tb_test=T;
    Nlb_test=2;
    
elseif basis_type_test==102
    
    % ?;
    
end