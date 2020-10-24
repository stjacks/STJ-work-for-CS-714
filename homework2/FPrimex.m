function [y] = FPrimex(x)
%Fx: Calculates f(x) as defined in Problem B and used in Problem C
y = -800*(x-0.5).*exp(-400*(x-0.5).^2);
end

