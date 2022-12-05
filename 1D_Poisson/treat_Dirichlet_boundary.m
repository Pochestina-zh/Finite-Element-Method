function [A,b]=treat_Dirichlet_boundary(boundary_fun,boundarynodes,A,b,Pb_trial)
%% initialize the variable
number_boundarynodes=size(boundarynodes,2);     % the number of boundarynodes

%% boundarynodes treatment for different conditions
for k=1:number_boundarynodes
    
    if boundarynodes(1,k)==-1   % Dirichlet condition
        
    i=boundarynodes(2,k);   % global Pb_trial index for k-th boundarynode
    
    A(i,:)=0;
    A(i,i)=1;
    
    b(i,1)=feval(boundary_fun,Pb_trial(:,i)); % force the vector to satisfy boundary function
    
    elseif boundarynodes(1,k)==-2   % Neumann condition
%        ?
    elseif boundarynodes(1,k)==-3   % Robin condition
%        ?
    else
        
        warining='Wrong input for boundary condition!'
        
    end
    
end


