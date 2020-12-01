clear;

N = 128;

dx = 1/N;
dt = (0.5)*dx; % TBD

xs = 0:dx:1;

%Q0 = initUpwind(xs, dx); % initial averages of cell values.
Q = (3/2) + sin(2*pi*xs);
iter = 0

while 1
    iter = iter + dt
    plot(xs, Q);
    ylim([-1,3])

    Q = upwind(Q,dt,dx,1);
    pause(0.1);
end
