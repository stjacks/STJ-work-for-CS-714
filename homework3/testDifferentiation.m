N = 10;
[D,x] = cheb(N);
u = x; % linear function

%w = chebfft(u) % should be all ones, subject to numerical error
%v = chebfft(w) % should be all zeros, subject to numerical error

% U(x,y) = x + y
U = zeros(N+1,N+1);
for i = 1:N+1
    for j = 1:N+1
        U(i, j) = x(i) + x(j);
    end
end

%Nabla(U,1) % should be a matrix of all ones, subject to numerical error

Nabla(U,2) % should be a matrix of all zeros, subject to numerical error
Laplacian(U)