N = 10;
[D,x] = cheb(N);
u = x; % linear function

U = zeros(N+1,N+1);
for i = 1:N+1
    for j = 1:N+1
        U(i, j) = x(i) + x(j);
    end
end

Nabla(U,1)