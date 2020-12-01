% please excuse the fact that I hard-coded everything.
clear;
%figure;

fN = 512;
fdx = 1/fN;
fxs = 0:fdx:1;
fdt = (0.4)*fdx;

T = 0.7;
Ns = [32 64 128 256 ];%512 1024];
err = zeros(1, length(Ns));

for i = 1:length(Ns)
    N = Ns(i);
    dx = 1./N;
    xs = 0:dx:1;
    Q = (3/2) + sin(2*pi*xs);
    dt = 0.4*dx;
    
    fQ = (3/2) + sin(2*pi*fxs);
    diff = fN/N;
    
    numRounds = round(T/dt);
    
    for j=1:numRounds
        fQ = upwind(fQ,fdt,fdx,diff);
        Q = upwind(Q,dt,dx,1);
        err(i) = max(maxError(fQ,Q, diff),err(i));
%         % code for visualization for debugging purposes.
%        if i==5
%            plot(xs,Q);
%            hold on
%            plot(fxs,fQ);
%            hold off
%            legend('coarse', 'fine');
%            pause(0.1);
%        end
    end
end

plot(log(Ns), log(err), '.-');
title(strcat("Upwind error vs grid size at time T=", num2str(T)));
xlabel("log of number of points (2^x points)")
ylabel("log of absolute error")
ax = gca;
ax.FontSize = 14;