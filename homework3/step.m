function [vvNew,vvCurr] = step(vvCurr,vvOld, dt)
%step Calculates the next step given the method from C.a
% Input:
%   vvCurr: matrix at current time step
%   vvold : matrix at previous time step
%   dt    : size of time step
% Output:
%   vvNew : matrix at next time step
%   vvCurr: matrix at current time step (same as input)

N = size(vvCurr,1) - 1;
vvL = Laplacian(vvCurr); %one application of the Laplacian
vvLL = Laplacian(vvL);   %two applications of the Laplacian
    
vvNew = -vvOld + 2*vvCurr + ((dt)^2)*vvL + (1/12)*((dt)^4)*vvLL;

% homogeneous boundary conditions
vvNew(1,:) = 0;
vvNew(N+1,:) = 0;
vvNew(:,1) = 0;
vvNew(:,N+1) = 0;
end

