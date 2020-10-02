function [uCurr] = Jacobi(u)
%Jacobi: performs jacobi iteration on the input matrix u.
% Implementation follows that of Leveque pg ...

n = size(u,1) - 1;
h = 1 / n;

%max number of iterations is 4096
uCurr = u; % current u matrix
for iter=1:4096
    
    if mod(iter, 10) == 0
        disp(iter);
    end
    uNew = uCurr; % copies values that don't change, i.e. Dirichlet
                  % boundary conditions
    
    X = 2:n;
    Y = 2:n;
    
                  
    % x coords. We don't need to update the first (x=0) or last (x=1)
    % because of the Dirichlet bounds.
        
    % update edge points (y=0) and (y=1) to match Neumann conditions
    % according to the O(h^2) forward difference formula for the first
    % derivative.
    % Since (1/2h)*(3u0 - 4u1 + u2) = 0, we have
    % u0 = (4/3)u1 - (1/3)u2
    uNew(X,1)   = (4/3)*uCurr(X, 1) - (1/3)*uCurr(X, 2);
    uNew(X,n+1) = (4/3)*uCurr(X, n) - (1/3)*uCurr(X, n-1);
       
    uNew(X,Y) = (1/4)*(  uCurr(X-1, Y) + uCurr(X+1, Y) ...
                               + uCurr(X, Y-1) + uCurr(X, Y+1));
    
    uCurr = uNew;
    
                                   
end

end

