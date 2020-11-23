function [Q] = godunov(Q, dt, dx, steps)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

N = length(Q);

% These indices use the periodic boundary conditions.

for i=1:steps
    
    F = flux(Q,0); 
    
    Q = Q - (dt/dx)*(F(2:N+1) - F(1:N));
    
end

end

