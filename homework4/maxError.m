function [e] = maxError(A,B, diff)
%maxError: Determine the maximum error between vectors A and B where B is 
% sampled on a subset of the grid of A. diff is the 
% multiple that A is larger than B
sizeB = length(B) - 1;

% want to sample A on the same points B is, but need to account for 1-based
% indexing
index = 0:sizeB-1;
subsetA = [(diff * index) + 1, length(A)]; 

errorVector = abs(A(subsetA) - B);
e = max(errorVector);

end

