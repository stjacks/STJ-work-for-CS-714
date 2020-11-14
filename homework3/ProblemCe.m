clear
N = 64;
T = 0.75;

waveDt = (1/N)*(1/10);

Bs = 0:0.1:1;
errSp = zeros(11,1); % spectral error
errFd = zeros(11,1); % finite difference error

sol = CeSolution(N, T);

for B = Bs
    spect = spectralWave(N, T, B);
    fD = wave_solution(N, T, waveDt, B);
    
    
end