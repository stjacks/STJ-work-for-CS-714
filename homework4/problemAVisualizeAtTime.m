clear;
clf;

%Ns = [16, 32, 64, 128, 256, 512];
Ns = [128]
Nstring = string(Ns);
T = 0.25;

for i=1:length(Ns)
    N = Ns(i);

    dx = 1/N;
    dt = (0.5)*dx;

    xs = 0:dx:1;
    Q = (3/2) + sin(2*pi*xs);
    
    numIters = round(T/dt);
    Q = upwind(Q,dt,dx,numIters);
    
    hold on
    plot(xs, Q);
    hold off
    
end

legend(Nstring);
ylim([0, 3])
title(strcat('Visualization at time approximately T=', num2str(T)));
ax = gca;
ax.FontSize = 14;