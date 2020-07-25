function [U] = procrustrus(A)
% Procrustes

[m, n] = size(A);

[P, S, Q] = svd(A, 0);  % Economy size.
if m < n                % Ditto for the m<n case.
   S = S(:, 1:m);
   Q = Q(:, 1:m);
end
U = P*Q';

