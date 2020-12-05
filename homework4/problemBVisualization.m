clear;

N = 401;

dx = 1/N;
dt = 0.45*dx; 

xs = 0:dx:1;
avgs = (xs(1:N) + xs(2:N+1))/2;

Q = initGodunov(xs, dx); % initial averages of cell values.
%Q = (3/2) + sin(2*pi*xs);
%iter = 0

while 1
    %iter = iter + dt
    plot(avgs, Q);
    ylim([-1,3]);
    
    Q = godunov(Q,dt,dx,1);
    pause(0.1);
end
