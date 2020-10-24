function [uNew] = multiStep(uCurr, uOld, deltaX, deltaT)
%multiStep: Performs the next step in Problem C.a (i.e., any step except
% the first)

xs = size(uCurr,1); % number of x points
ys = size(uCurr,2); % number of y points
uNew = 2*uCurr - uOld; % update based on approximation in time

% Now we just need to modify uNew so that it uses the 5-point stencil
% in space on uCurr. We will use a 2nd order forward difference formula
% for the second derivative on the edges. 

% update y=0  using the 2nd order forward difference formula for the
% second derivative in y
XS = 1:xs;
YS = 1;
uNew(XS,YS) = uNew(XS,YS) + (deltaT^2) * (1/(deltaX^2)) * ...
            (uCurr(XS,YS) - 2*uCurr(XS,YS+1) + uCurr(XS,YS+2));
        
% update y=1 using the 2nd order forward difference formula in y
XS = 1:xs;
YS = ys;
uNew(XS,YS) = uNew(XS,YS) + (deltaT^2) * (1/(deltaX^2)) * ...
            (uCurr(XS,YS) - 2*uCurr(XS,YS-1) + uCurr(XS,YS-2));
        
% update y=deltaX through y=1-deltaX with central difference formula in y
XS = 1:xs;
YS = 2:ys-1;
uNew(XS,YS) = uNew(XS,YS) + (deltaT^2) * (1/(deltaX^2)) * ...
            (uCurr(XS,YS+1) - 2*uCurr(XS,YS) + uCurr(XS,YS-1));

% update x=0 similarly to y=0
XS = 1;
YS = 1:ys;
uNew(XS,YS) = uNew(XS,YS) + (deltaT^2) * (1/(deltaX^2)) * ...
            (uCurr(XS,YS) - 2*uCurr(XS+1,YS) + uCurr(XS+2,YS));
        
% update x=1 similarly to y-1
XS = xs;
YS = 1:ys;
uNew(XS,YS) = uNew(XS,YS) + (deltaT^2) * (1/(deltaX^2)) * ...
            (uCurr(XS,YS) - 2*uCurr(XS-1,YS) + uCurr(XS-2,YS));
        
% update x=deltaX through x=1-deltaX with central difference formula
XS = 2:xs-1;
YS = 1:ys;
uNew(XS,YS) = uNew(XS,YS) + (deltaT^2) * (1/(deltaX^2)) * ...
            (uCurr(XS+1,YS) - 2*uCurr(XS,YS) + uCurr(XS-1,YS));


end


