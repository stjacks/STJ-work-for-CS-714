function [u, x, y] = wave_solution(N, T, dt, B)
% Sourced from class Github. Modified slightly to match new initial
% conditions and remove plotting.

% solving the wave equation
%                           N:         number of grid points
%                           T:         final time
%                           dt:        time step
%                           plot_bool: to plot the solution
%                           plot_n:    number of time steps to wait
%                                      between plots of the solution

% an if block to be sure that there are enough paramaters
if nargin < 5
    plot_n = 100;
    if nargin < 4
        plot_bool = true;
    end
end

% initial condition
ut = @(x,y)(sin(B*pi*x).*sin(B*pi*y)); % modified for new initial condition

% number of iterations
Nit = ceil(T/dt);
% we suppose that both dimension have the same number of points
M = N;

% grid spacing
dx = 1/(N-1);
dy = 1/(M-1);

% grids in each dimension
x = 0:dx:1;
y = 0:dy:1;

% 2D grids
[X Y] = meshgrid(x,y);

% defining the parameter alpha
alpha = dt^2/2;

% initial guess
u0 = zeros(M, N);
% initialization using the initial speed
u1 = u0 + dt*ut(X,Y);
% the n+1 field
u =  zeros(M, N);

for i = 1:Nit
    
    % u^{n+1} = -u^{n-1} + [dt^2(D_{c,x} + D_{c,y}) + 2]u^{n}
    u = -u0 + 2*Ah(u1, dx, dy, alpha);
    % update u^{n} and u^{n-1}
    u0 = u1;
    u1 = u;
end

end