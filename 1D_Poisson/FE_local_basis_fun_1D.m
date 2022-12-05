function result=FE_local_basis_fun_1D(x,vertices,basis_type,basis_index,basis_der_x)

% x is the independent variable FE local basis function
% vertices are the coordinates of local n-th element nodes to generate the FE local basis function

% basis_type==101: 1D linear
% basis_type102: 1D quadratic

h=vertices(2)-vertices(1);  % the length of the interval

%% FE local basis function 1D generate
if basis_type==101
    if basis_index==1
        if basis_der_x==0
            result=(vertices(2)-x)/h;
        elseif basis_der_x==1
            result=-1/h;
        elseif basis_der_x>=2 && rem(basis_der_x,1)==0
            result=0;
        else
        warning='wrong input for basis derivative order!'
        end
        
    elseif basis_index==2
        if basis_der_x==0
            result=(x-vertices(1))/h;
        elseif basis_der_x==1
            result=1/h;
        elseif basis_der_x>=2 && rem(basis_der_x,1)==0
            result=0;
        else
        warning='wrong input for basis derivative order!' 
        end
    else
        warning='wrong input for basis index!'
    end
elseif basis_type==102
%    ?
end

