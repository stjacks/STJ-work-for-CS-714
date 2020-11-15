function [y] = Fx(x)
%Fx: Calculates f(x) as defined in Homework 2 Problem B/C WITH an extension
%so it's range is -1 to 1 instead of 0 to 1
y = exp(-400*((0.5*x+0.5)-0.5).^2);
end

