function [Unew] = upwind(U, dt, dx, steps)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

N = length(U);

Unew = U;

% These indices use the periodic boundary conditions.
backward = [N, 1:(N-1)]; 
forward = [2:N, 1];

for i=1:steps
    Uforward = U(forward) - U;
    Uback = U - U(backward);
    
    Uplus = U > 0;
    Uminus = U < 0;
    
    spaceDiscretization = Uplus.*Uback + Uminus.*Uforward;
    
    Unew = U - (dt/dx).*U.*spaceDiscretization;
    U = Unew;    
end

end

