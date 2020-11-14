function [w] = firstFFT(v)
%firstFFT: uses FFT to calculate first derivative of interpolation
%    Assumptions: v is column vector.
N = length(v) - 1;
thetas = (1/N)*pi*(0:N);
xs = cos(thetas);
ys = cos(thetas);

V = [v, flipud(v(2:N))];


Vhat = fft(V);
What = 1i*(-N+1:N).*Vhat;
W = ifft(What);

w = zeros(N+1,1);
w(2:N) = -W(2:N)./sqrt(1-xs(2:N).^2);

sumOver = 1:(N-1);
w(1) = (1/(2*pi))*sum((sumOver.^2).*Vhat(sumOver)) ...
     + (1/(4*pi))*N*N*Vhat(N+1);
w(N+1) = (1/(2*pi))*sum(((-1).^(sumOver)).*(sumOver.^2).*Vhat(sumOver)) ...
       + (1/(4*pi))*((-1)^(N+1))*N*N*Vhat(N+1);

end

