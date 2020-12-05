clear;

N = 400;

dx = 1/N;
dt = 0.4*dx;

xs = 0:dx:1;
avgs = (xs(1:N) + xs(2:N+1))/2;

G = initGodunov(xs, dx);
U = (3/2) + sin(2*pi*xs);

iter = -dt;

T = 0.7; % set to non-zero time if you want it to evolve until that time.

while 1
    iter = iter + dt
    plot(xs, U);
    hold on
    plot(avgs, G);
    hold off
    ylim([-1,3])

    U = upwind(U,dt,dx,1);
    G = godunov(G, dt, dx, 1);
    
    if iter > T
        break;
    end
    % uncomment if you want to watch it evolve over time
    %pause(0.1);
end

title(strcat("Upwind vs. Godunov at time T=", num2str(T)));
legend(["Upwind", "Godunov"])
ax = gca;
ax.FontSize = 14;