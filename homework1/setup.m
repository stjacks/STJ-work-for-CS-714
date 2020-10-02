function [u] = setup(n)
%setup: performs setup of the matrix from Problem 3 in the homework for a
% given granularity n. We sample points at intervals of h=1/n between 0
% and 1 inclusive.
h = 1/n;
u = zeros(n+1, n+1);
for i=1:n+1
    u(1, i) = cos(2*pi*(i-1)*h);
end

