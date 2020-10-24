function [e] = maxError(A,B, diff)
%maxError: Determine the maximum error between A and B where B is sampled
% on a subset of the grid of A. both are square matrices. diff is the 
% multiple that A is larger than B
sizeB = size(B,1);

% want to sample A on the same points B is, but need to account for 1-based
% indexing
index = 0:sizeB-1;
subsetA = (diff * index) + 1; 

ErrorMatrix = abs(A(subsetA, subsetA) - B);
e = max(ErrorMatrix, [], 'all');

end

