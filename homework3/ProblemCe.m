clear
N = 64;
T = 0.75;

waveDt = (1/N)*(1/10);

Bs = 1:11;
errSp = zeros(length(Bs),1); % spectral error
errFd = zeros(length(Bs),1); % finite difference error

spectErrors = zeros(11,1);
fdErrors = zeros(11,1);

for B = Bs
    disp(B);
    [spect, xs, ys] = spectralWave(N, T, B);
    [fd, xf, yf] = wave_solution(N, T, waveDt, B);
    
    spectSolution = (1/(2*B*pi))*sin(B*pi*ys)*sin(B*pi*xs).*sin(2*B*pi*T);
    fdSolution = (1/(2*B*pi))*sin(B*pi*yf')*sin(B*pi*xf).*sin(2*B*pi*T);
    
    spectError = max(max(spectSolution - spect));
    fdError = max(max(fdSolution - fd));
    
    errorIndex = round(B*10+1);
    spectErrors(errorIndex) = log(spectError);
    fdErrors(errorIndex) = log(fdError);
end

hold on
plot(B, spectErrors);
plot(B, fdErrors);

ax = gca;
ax.YAxis.FontSize = 13;
ax.XAxis.FontSize = 13;

title('Error by change in B','Interpreter','latex', 'FontSize', 24);
xlabel('B','Interpreter','latex', 'FontSize', 18)
ylabel('Error at time 0.75','Interpreter','latex', 'FontSize', 18)
