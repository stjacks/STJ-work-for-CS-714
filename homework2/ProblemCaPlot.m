N=100;
maxE = 1.0e-9 * [0.1634 0.0408 0.0101 0.0024];
numPoints = N*[2^2 2^3 2^4 2^5];
deltaXs = 1./numPoints;

figure(1); clf();
loglog(deltaXs,maxE,'o-', 'LineWidth', 2)
hold on; 
loglog(deltaXs, deltaXs.^2, 'LineStyle', '-')

ax = gca;
ax.YAxis.FontSize = 13;
ax.XAxis.FontSize = 13;

title('Error by change in $\Delta x$','Interpreter','latex', 'FontSize', 24);
xlabel('$\Delta x$','Interpreter','latex', 'FontSize', 18)
ylabel('max error relative to a fine grid','Interpreter','latex', 'FontSize', 18)