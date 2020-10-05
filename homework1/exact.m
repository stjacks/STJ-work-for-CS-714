function [answer] = exact(x,y)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
aTmp = -1/(exp(4*pi) - 1);
a = aTmp * exp(2*pi*x);

bTmp = exp(4*pi)/(exp(4*pi)-1);
b = bTmp * exp(-2*pi*x);

answer = cos(2*pi*y)*(a + b);
end

