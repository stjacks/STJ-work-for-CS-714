clear;

N = 10;
thetas = (1/N)*pi*(0:N);
x = cos(thetas); % these values go from -1 to 1. We need from 0 to 1
x = (1/2)*x + 0.5;
y = x';

U = y*x;

d = Laplacian(U);
error = max(max(abs(d)));
disp(["The error for test 1 is ", num2str(error)]);

for i = 1:N+1
    for j = 1:N+1
        U(i,j) = x(i) + y(i);
    end
end
d = Laplacian(U);
error = max(max(abs(d)));
disp(["The error for test 2 is ", num2str(error)]);