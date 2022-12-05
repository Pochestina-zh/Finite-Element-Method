function absolute_error=maximum_error_FE_nodes(exact_fun,solution,Pb_trial)
%% initialize variable
number_basis_trial=size(solution,1);    % the number of basis trial
analytic_solution=sparse(number_basis_trial,1);

% number_basis_trial
%% compute the analytic soulution
for k=1:number_basis_trial
    analytic_solution(k,1)=analytic_solution(k,1)+feval(exact_fun,Pb_trial(k));
end
% Pb_trial(1)
% analytic_solution
% Pb_trial(number_basis_trial)
%% compute the error
absolute_error=norm(abs(solution-analytic_solution),inf);

