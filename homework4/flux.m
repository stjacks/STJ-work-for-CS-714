function [F] = flux(Q,qs)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
N = length(Q);
F = zeros(1, N+1);

f = @(x) (1/2)*(x.^2);

for i=1:(N+1)
    if i==N+1, a=Q(1); else, a=Q(i); end
    if i==1, b=Q(N); else, b=Q(i-1); end % periodic boundary conditions
    
    if f(a) == f(b)
        F(i) = f(b); % doesn't matter if f(Q_i) or F(Q_(i-1))
        continue;
    end
    
    S = (f(a) - f(b))/(a-b);
    
    if (b > qs) && S > 0
        F(i) = f(b);
    elseif (a < qs) && (S < 0)
        F(i) = f(a);
    elseif (b < qs) && (qs < a)
        F(i) = f(qs);
    else
        disp("Issues!");
    end

end

end

