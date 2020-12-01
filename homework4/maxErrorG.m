function [e] = maxErrorG(A,B, diff)
%maxError: Determine the maximum error between vectors A and B where B is 
% sampled on a subset of the grid of A. diff is the 
% multiple that A is larger than B

indexs = [];
for i=1:length(B)
    indexs = [indexs i*ones(1,diff)];
end

% want to sample A on the same points B is, but need to account for 1-based
% indexing
errorVector = abs(A - B(indexs));
e = max(errorVector);

end

