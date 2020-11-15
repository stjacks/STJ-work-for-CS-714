N = 10;
thetas = (1/N)*pi*(0:N);
x = cos(thetas)'; % these values go from -1 to 1. We need from 0 to 1


U = x
d = chebfft(U);
error = max(max(abs(d - 1)));
disp(["The error for test 1 is ", num2str(error)]);

d = chebfft(d);
error = max(max(abs(d)));
disp(["The error for test 1.2 is ", num2str(error)]);

U = sin(x);
d = chebfft(U);
error = max(max(abs(d - cos(x))));
disp(["The error for test 2 is ", num2str(error)]);
d = chebfft(d);
error = max(max(abs(d + sin(x))));
disp(["The error for test 2.1 is ", num2str(error)]);


U = exp(x);
d = chebfft(U);
error = max(max(abs(d - U)));
disp(["The error for test 3 is ", num2str(error)]);