function [uTot] = Nabla(vv,numPartials)
%Nabla Takes numpartial derivatives in x and y, and returns the sum of
%both. Follows the structure from Trefethen Program 20, except we call
% firstFFT to perform our Fourier transforms.
% Input:
%    vv: matrix to take partial derivatives of. Assumed to be 2 dimensional
%    numPartials: number of partial derivatives to take in x and y
% Output:
%    uTot: sum of (numPartial derivatives in x of vv) and (numPartial
%          derivatives in y of vv)

N = size(vv,1) - 1;

uxs = zeros(N+1,N+1);
uys = zeros(N+1,N+1);

for i = 1:N+1
    v = vv(i,:);
    w = chebfft(v);
    for j=2:numPartials
        w = chebfft(w);
    end
    uxs(i,:) = w;
end

for i = 1:N+1
    v = vv(:,i);
    w = chebfft(v');
    for j=1:numPartials
        w = chebfft(w);
    end
    uys(:,i) = w';
end

uTot = uxs + uys;
end

