clear;

N = 10;
thetas = (1/N)*pi*(0:N);
x = cos(thetas); % these values go from -1 to 1. We need from 0 to 1
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
error = max(max(abs(d(2:N,2:N))));
disp(["The error for test 2 is ", num2str(error)]);

for i = 1:N+1
    for j = 1:N+1
        U(i,j) = sin(x(i)) + sin(y(i));
    end
end
d = Laplacian(U);
error = max(max(abs(d + U)));
disp(["The error for test 3 is ", num2str(error)]);
d = Laplacian(d);
error = max(max(abs(d - U)));
disp(["The error for test 3.1 is ", num2str(error)]);