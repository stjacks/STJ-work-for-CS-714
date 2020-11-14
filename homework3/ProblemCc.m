% Solves Problem Cc
clear;

N = 100;
thetas = (1/N)*pi*(0:N);
xs = cos(thetas);
ys = cos(thetas);
dt = sqrt(125)*(1/N)^2;

fN = 500; % fine grid
fthetas = (1/fN)*pi*(0:fN);
fxs = cos(fthetas);
fys = cos(fthetas);
fdt = sqrt(125) * (1/fN)^2;

vold = zeros(N+1,N+1);
vcurr = firstStep(vold, Fx(xs)'*Fx(ys), dt);

fold = zeros(fN+1,fN+1);
fcurr = firstStep(fold, Fx(fxs)'*Fx(fys), fdt);

fineRounds = dt / fdt;

numRounds = round(0.1/dt);

error = 0;
disp(numRounds)
for rounds=0:numRounds
    if mod(rounds, 10) == 0
        disp(['Round ', num2str(rounds), 'out of ', num2str(numRounds)])
    end
    [vcurr, vold] = step(vcurr, vold, dt);
    
    for tmp=1:fineRounds
       if mod(tmp, 10) == 0
           disp(['findIteration', num2str(tmp), 'out of', num2str(fineRounds)]);
       end

       [fcurr, fold] = step(fcurr, fold, fdt);
    end
    
    error = max(error,maxError(fcurr, vcurr, fN / N));
    
end
disp(error);
disp(['Error for', num2str(N), 'is', num2str(error)]);
