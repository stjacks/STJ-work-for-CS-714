function [L] = Laplacian(vv)
%Laplacian: takes the laplacian of the input vector vv.
N = size(vv,1) - 1;
thetas = (1/N)*pi*(0:N);
x = cos(thetas);
y = x';

uxx = zeros(N+1,N+1); uyy = zeros(N+1,N+1);
for i = 1:N+1 % 2nd derivs wrt x in each row
    v = vv(i,:); 
    w = chebfft(v');
    w2 = chebfft(w);
    uxx(i,:) = w2';
%     V = [v fliplr(v(ii))];
%     U = real(fft(V));
%     W1 = real(ifft(1i*[0:N-1 0 1-N:-1].*U)); % diff wrt theta
%     W2 = real(ifft(-[0:N 1-N:-1].^2.*U)); % diff - 2 wrt theta
%     uxx(i,ii) = W2(ii)./(1-x(ii).^2) - x(ii).* ...
%                 W1(ii)./(1-x(ii).^2).^(3/2);
end
for j = 1:N+1 % 2nd derivs wrt y in each column
    v = vv(:,j); 
    w = chebfft(v);
    w2 = chebfft(w);
    uyy(:,j) = w2;
%     V = [v; flipud(v(ii))];
%     U = real(fft(V));
%     W1 = real(ifft(1i*[0:N-1 0 1-N:-1]'.*U));% diff wrt theta
%     W2 = real(ifft(-[0:N 1-N:-1]'.^2.*U)); % diff"2 wrt theta
%     uyy(ii,j) = W2(ii)./(1-y(ii).^2) - y(ii).* ...
%                 W1(ii)./(1-y(ii).^2).^(3/2);
end
L = uxx + uyy;
end

