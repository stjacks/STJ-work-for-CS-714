clear;
clf;

dts = [0.5,0.3,0.1];
dtString = string(dts);

N = 128;
T = 0.25;

for i=1:length(dts)

    dx = 1/N;
    
    dt = dts(i)*dx;
    
    xs = 0:dx:1;
    Q = (3/2) + sin(2*pi*xs);
    
    numIters = round(T/dt);
    Q = upwind(Q,dt,dx,numIters);
    
    hold on
    plot(xs, Q);
    hold off
    
    end

legend(dtString);

ylim([0, 3])
title(strcat('Visualization at time approximately T=', num2str(T)));
ax = gca;
ax.FontSize = 14;