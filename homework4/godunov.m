function [Q] = godunov(Q, dt, dx, steps)
%godunov Implements Godunov's method
%
%   input: Q, vector of Qis
%         dt, delta t (granularity in time stepping)
%         dx, delta x (granularity in grid spacing)
%      steps, number of steps to run Godunov's method
%
%   output: Q, vector of Qis at time dt*steps

N = length(Q);

for i=1:steps
    
    F = flux(Q,0); 
    
    Q = Q - (dt/dx)*(F(2:N+1) - F(1:N));
    
end

end

