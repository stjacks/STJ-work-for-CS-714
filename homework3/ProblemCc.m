% Solves Problem Cc
clear;

N = 100;
thetas = (1/N)*pi*(0:N);
xs = cos(thetas);
ys = cos(thetas);
dt = 6*(1/N)^2; % smaller than the CFL condition

fN = 600; % fine grid
fthetas = (1/fN)*pi*(0:fN);
fxs = cos(fthetas);
fys = cos(fthetas);
fdt = 6*(1/fN)^2; % smaller than the CFL condition

vold = zeros(N+1,N+1);
vcurr = firstStep(vold, Fx(xs)'*Fx(ys), dt);

fold = zeros(fN+1,fN+1);
fcurr = firstStep(fold, Fx(fxs)'*Fx(fys), fdt);

fineRounds = dt / fdt;

for tmp=2:fineRounds
   [fcurr, fold] = step(fcurr, fold, fdt);
end

numRounds = round(0.1/dt);

error = max(0,maxError(fcurr, vcurr, fN / N));
disp(numRounds)
for rounds=2:numRounds
    if mod(rounds, 10) == 0
        disp(['Round ', num2str(rounds), ' out of ', num2str(numRounds)])
        disp(['Current error: ', num2str(error)]);
    end
    [vcurr, vold] = step(vcurr, vold, dt);
    
    for tmp=1:fineRounds
       if mod(tmp, 10) == 0
           disp(['findIteration ', num2str(tmp), ' out of ', num2str(fineRounds)]);
       end

       [fcurr, fold] = step(fcurr, fold, fdt);
    end
    
    error = max(error,maxError(fcurr, vcurr, fN / N));
    
end
disp(error);
disp(['Error for ', num2str(N), ' is ', num2str(error)]);
