function [Gauss_weight,Gauss_nodes]=generate_Gauss_local_1D(vertices,Gauss_quad_type)

% Gauss_quad_type==1: 2-points Gauss quadrature
% Gauss_quad_type==2: 4-points Gauss quadrature
% Gauss_quad_type==3: 8-points Gauss quadrature

%% Gauss quadrature on [-1,1]
if Gauss_quad_type==1
    
    Gauss_weight=[1,1];
    Gauss_nodes=[1/sqrt(3),-1/sqrt(3)];

elseif Gauss_quad_type==2

    Gauss_weight=[0.3478548451,0.3478548451,0.6521451549,0.6521451549];
    Gauss_nodes=[0.8611363116,-0.8611363116,0.3399810436,-0.3399810436];
    
elseif Gauss_quad_type==3
    
    Gauss_weight=[0.1012285363,0.1012285363,0.2223810345,0.2223810345,0.3137066459,0.3137066459,0.3626837834,0.3626837834];
    Gauss_nodes=[0.9602898565,-0.9602898565,0.7966664774,-0.7966664774,0.5255324099,-0.5255324099,0.1834346425,-0.1834346425];

else   
    warning='Wrong input for Gauss  locally intergal type!'
    
end

%% Convert the quadrature on the mesh element
upper_bound=vertices(:,2);  
lower_bound=vertices(:,1);

Gauss_weight=(upper_bound-lower_bound)*Gauss_weight/2;
Gauss_nodes=(upper_bound+lower_bound)/2+(upper_bound-lower_bound)*Gauss_nodes/2;  

