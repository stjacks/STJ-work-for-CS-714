% From part B we found that an initial N=100 guarantees < 10^-2 error.

N = 100;

exps = [2,3,4,5,6];
numPoints = N*2.^exps;
deltaXs = 1./numPoints;

fineDeltaX = N*(2^8);
deltaT = fineDeltaX * 100; % to satisfy the CFL condition and not mess up our
                       % analysis of error based on deltaX
                       
diffs = [2^6, 2^5, 2^4, 2^3, 2^2]; % needed for maxError function
                       
UFineCurr = firstStep(fineDeltaX, deltaT);
UFineOld = zeros(fineDeltaX, fineDeltaX);

UCurr = [
    zeros(numPoints(1)+1,numPoints(1)+1)
    zeros(numPoints(2)+1,numPoints(2)+1)
    zeros(numPoints(3)+1,numPoints(3)+1)
    zeros(numPoints(4)+1,numPoints(4)+1)
    zeros(numPoints(5)+1,numPoints(5)+1)];

UOld = [
    zeros(numPoints(1)+1,numPoints(1)+1)
    zeros(numPoints(2)+1,numPoints(2)+1)
    zeros(numPoints(3)+1,numPoints(3)+1)
    zeros(numPoints(4)+1,numPoints(4)+1)
    zeros(numPoints(5)+1,numPoints(5)+1)];

for i=1:5
    UCurr(i) = firstStep(deltaXs(i), deltaT);
    UOld(i) = zeros(deltaXs(i), deltaXs(i));
end

% since deltaT is fixed, there's no error after the first step.

maxE = [0,0,0,0,0];

for t=1:round(1/deltaT) % iterate for t=0 through t=1
    UFineNew = multiStep(UFineCurr, UFineOld, fineDeltaX, deltaT);
    
    for i=1:5
        UNew = multiStep(UCurr(i), UOld(i), deltaXs(i), deltaT);
        maxE(i) = max(maxE(i), ...
                      maxError(uNew, uFineNew, diffs(i)));
        UOld(i) = UCurr(i);
        UCurr(i) = UNew;
    end
    
    UFineOld = UFineCurr;
    UFineCurr = UNew;
end

% Plotting the results. See "convergence_direct_solver.m" provided by
% the professor for source.
figure(1); clf();
loglog(deltaXs,maxErr,'o-', 'LineWidth', 2)
hold on; 
loglog(deltaXs, deltaXs.^2, 'LineStyle', '-')

ax = gca;
ax.YAxis.FontSize = 13;
ax.XAxis.FontSize = 13;

title('Error', 'FontSize', 24);
xlabel('$\Delta x$','Interpreter','latex', 'FontSize', 24)
ylabel('relative max error','Interpreter','latex', 'FontSize', 24)