clear

% From part B we found that an initial N=100 guarantees < 10^-2 error.
N = 100;

exps = [2,3,4,5];
numPoints = N*2.^exps;
deltaXs = 1./numPoints;

finePoints = N*(2^7);
fineDeltaX = 1/(finePoints);
deltaT = fineDeltaX * 100; % to satisfy the CFL condition and not mess up our
                       % analysis of error based on deltaX
                       
diffs = [ 2^5, 2^4, 2^3, 2^2]; % needed for maxError function

% since deltaT is fixed, there's no error after the first step.

maxE = [0,0,0,0];
for i=1:4
    UCurr = firstStep(deltaXs(i), deltaT);
    UOld = zeros(numPoints(i)+1,numPoints(i)+1);
    
    UFineCurr = firstStep(fineDeltaX, deltaT);
    UFineOld = zeros(finePoints + 1, finePoints + 1);
    
    for t=1:round(1/deltaT) % iterate for t=0 through t=1
        UFineNew = multiStep(UFineCurr, UFineOld, fineDeltaX, deltaT);
        UNew = multiStep(UCurr, UOld, deltaXs(i), deltaT);
        
        maxE(i) = max(maxE(i), ...
                      maxError(UNew, UFineNew, diffs(i)));
        UOld = UCurr;
        UCurr = UNew;
        UFineOld = UFineCurr;
        UFineCurr = UNew;
    end
end
disp(maxE);
% Plotting the results. See "convergence_direct_solver.m" provided by
% the professor for source.
%figure(1); clf();
%loglog(deltaXs,maxE,'o-', 'LineWidth', 2)
%hold on; 
%loglog(deltaXs, deltaXs.^2, 'LineStyle', '-')

%ax = gca;
%ax.YAxis.FontSize = 13;
%ax.XAxis.FontSize = 13;

%title('Error by change in $\Delta x$','Interpreter','latex', 'FontSize', 24);
%xlabel('$\Delta x$','Interpreter','latex', 'FontSize', 18)
%ylabel('max error relative to a fine grid','Interpreter','latex', 'FontSize', 18)