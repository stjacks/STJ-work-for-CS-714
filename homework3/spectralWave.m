function [ucurr, xs, ys] = spectralWave(N, T, B)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
N = N-1;
thetas = (1/N)*pi*(0:N);
xs = cos(thetas); % these values go from -1 to 1. We need from 0 to 1
xs = (1/2)*xs + 0.5;
ys = xs';
dt = 6*(1/N)^2;


uold = zeros(N+1,N+1);

derivAtZero = sin(B*pi*xs).*sin(B*pi*ys);
ucurr = firstStep(uold, derivAtZero, dt);

numRounds = round(T/dt);

for rounds=2:numRounds
    [ucurr, uold] = step(ucurr, uold, dt);
      
end

end

