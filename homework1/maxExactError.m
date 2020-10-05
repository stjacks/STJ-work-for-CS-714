function [maxErr] = maxExactError(guess,h)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

numElements = size(guess,1);

maxErr = 0;
for x = 1:numElements
    for y = 1 : numElements
        err = abs(guess(x,y) - exact( (x-1)*h, (h-1) * h));
        
        if err > maxErr
            maxErr = err;
        end
    end
end
end

