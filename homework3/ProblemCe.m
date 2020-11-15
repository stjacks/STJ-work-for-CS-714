clear;
N = 64;
T = 0.75;

waveDt = (1/N)*(1/5);

Bs = 5:5:150;
errSp = zeros(length(Bs),1); % spectral error
errFd = zeros(length(Bs),1); % finite difference error
%errFd2 = zeros(length(Bs),1);
for i=1:length(Bs)
    B = Bs(i);
    disp(B);
    [spect, xs, ys, ts] = spectralWave(N, T, B);
    [fd, xf, yf] = wave_solution(N, T, waveDt, B);
    
    % adjust for x,y in [-1,1] instead of [0,1]
    spectSolution = (1/(sqrt(2)*B*pi))*sin(B*pi*(0.5*ys+0.5))*...
                     sin(B*pi*(0.5*xs+0.5)).*sin(sqrt(2)*B*pi*ts);
    fdSolution = (1/(sqrt(2)*B*pi))*sin(B*pi*yf')*sin(B*pi*xf).*...
        sin(sqrt(2)*B*pi*T);
    
    spectError = max(max(abs(spectSolution - spect)));
    fdError = max(max(abs(fdSolution - fd)));

    errSp(i) = log(spectError);
    errFd(i) = log(fdError);
end

disp(spectError)

hold on
plot(Bs, errSp, '-');
plot(Bs, errFd, '--');

ax = gca;
ax.YAxis.FontSize = 13;
ax.XAxis.FontSize = 13;

title('Error by change in B','Interpreter','latex', 'FontSize', 24);
xlabel('B','Interpreter','latex', 'FontSize', 18)
ylabel('log of error at time 0.75','Interpreter','latex', 'FontSize', 18)
hold off