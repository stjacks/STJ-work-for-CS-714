function [e] = maxErrorG(A,B, diff)
%maxErroGr: Determine the maximum error between vectors A and B where B is 
% averages of some function on a coarse grid while A is averages over a
% finer grid.

indexs = [];
for i=1:length(B)
    % if B(i) is an average over some interval [xi,xi+1] then we compare it
    % to the values of A in that same interval. A will consist of many
    % averages over that same interval, specifically diff many.
    indexs = [indexs i*ones(1,diff)];
end

errorVector = abs(A - B(indexs));
e = max(errorVector);

end

