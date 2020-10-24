function [U] = firstStep(deltaX, deltaT)
% firstStep: initializes the first step of the matrix U via forward Euler
% with the initial conditions described in Problem C.a
xs = 0:deltaX:1;
U = Fx(xs)' * Fx(xs);
U = deltaT * U;
end

