function [ucurr] = spectralWave(N, T, B)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
N = N-1;
thetas = (1/N)*pi*(0:N);
xs = cos(thetas);
ys = cos(thetas);
dt = sqrt(125)*(1/N)^2;


uold = zeros(N+1,N+1);

derivAtZero = sin(B*pi*xs).*sin(B*pi*ys);
ucurr = firstStep(uold, derivAtZero, dt);

numRounds = round(T/dt);

for rounds=2:numRounds
    [ucurr, uold] = step(ucurr, uold, dt);
      
end

end

