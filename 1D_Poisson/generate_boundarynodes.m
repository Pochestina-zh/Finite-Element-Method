function boundarynodes=generate_boundarynodes(Tb_trial,left_type,right_type)
% generete the information (condition,global index,normal direction) of boundarynodes

% boundarynodes(1,k)=-1,Dirichlet condition
% boundarynodes(1,k)=-2,Neumann condition
% boundarynodes(1,k)=-3,Robin condition
% boundarynodes(2,k) donotes the global index of nodes

% left_type and right_type are the given condition of the boundarynodes

% Tb_trial is the global index of the nodes on FE_trial elements

boundarynodes=zeros(2,2);

boundarynodes(1,:)=[left_type,right_type];

boundarynodes(2,:)=[Tb_trial(1,1),Tb_trial(2,size(Tb_trial,2))];   % global index for boundarynodes

