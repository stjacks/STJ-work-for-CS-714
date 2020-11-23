function [Unew] = upwind(U, dt, dx, steps)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

N = length(U);

Unew = U;

% These indices use the periodic boundary conditions.
forward = [2:N, 1]; 
backward = [N, 1:(N-1)]; 

for i=1:steps
    waveForward = U(forward) - U;
    waveBackward = U - U(backward); 
    
    %Uplus = U >= 0;
    %Uminus = U < 0;
    
    %Uplus = ones(N,1);
    %Uminus = zeros(N,1);
    
    % the following two lines are Equation 4.35 in LeVeque "Finite Volume
    % Methods for Hyperbolic Problems" (pg 76)
    %waveEffect = (Uplus.*waveBackward + Uminus.*waveForward);
    %Unew = U - (dt/dx).*U.*waveEffect;
    Unew = U - (dt/dx).*U.*waveBackward;
    
    U = Unew;    
end

end

