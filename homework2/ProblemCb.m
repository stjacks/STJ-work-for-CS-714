% This script creates a fine grid and plots the region for which the
% roots of the equation from C.b have magnitude <= 1
clear;

h = 1/(10^2);
rs = -5:h:1; % real parts
is = -10:h:10; % imaginary parts

plusRoot = @(x) (1/2)*((2+x) + sqrt( (2+x)^2 - 4));
minusRoot = @(x) (1/2)*((2+x) - sqrt( (2+x)^2 - 4));

hold on

for a=rs
    for b=is
        
        x = a + j*b;
        
        if abs(plusRoot(x)) > 1
            continue;
        end
        
        if abs(minusRoot(x)) > 1
            continue;
        end
        
        plot(a, b, 'k.')
    end
end
xlim([-5 1]);
ylim([-10 10]);
title("Points where C.b has absolute value <= 1")
xlabel("real part")
ylabel("imaginary part")
hold off