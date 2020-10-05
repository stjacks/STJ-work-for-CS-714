function [e] = maxError(guess, actual)
%maxError: returns the maximum norm of the error.
%   guess is an (m+1) by (m+1) matrix
%   actual is an (n+1) by (n+1) matrix with  m | n (m divides n)

m = size(guess,1) - 1;
n = size(actual,1) - 1;

% we need to sample N at the same points m is defined
smallN = zeros(m+1,m+1);
gap = n / m; % integer by assumption

for i=1:m+1
    for j = 1:m+1
        smallN(i, j) = actual( (i-1)*gap + 1, (j-1)*gap + 1);
    end
end
%disp(smallN - guess)a
% max error:
B = abs(smallN - guess);
e = 0;
for i = 1:m+1
    for j = 1:m+1
        if B(i,j) > e
            e = B(i,j);
        end
    end
end

%e = max(abs(smallN - guess),[],'all');
end

