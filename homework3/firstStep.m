function [u1] = firstStep(u0, ut0, dt)
%firstStep: takes the first step of the multistep method used to solve
%           Problem C.c
% Input:  
%    u0  : initial grid at time t=0
%    ut0 : Derivative with respect to t of u0
%    dt  : grid spacing in time
% Output: 
%    u1  : grid at time 1

N = size(u0,1) - 1;
u1 = u0 + dt*ut0 + (dt^2)*Laplacian(u0) + (dt^3)*Laplacian(ut0);

% homogeneous boundary conditions
u1(1,:) = 0;
u1(N+1,:) = 0;
u1(:,1) = 0;
u1(:,N+1) = 0;

end

