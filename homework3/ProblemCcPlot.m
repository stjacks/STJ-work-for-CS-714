N= [ 100, 150 ];
maxE = [ 8.7137e-12, 1.1273e-12];


figure(1); clf();
loglog(N,maxE,'o-', 'LineWidth', 2)
hold on; 
loglog(N, (1./N).^4, 'LineStyle', '--')

ax = gca;
ax.YAxis.FontSize = 13;
ax.XAxis.FontSize = 13;

title('Error by change in number of max points','Interpreter','latex', 'FontSize', 24);
xlabel('number of max points','Interpreter','latex', 'FontSize', 18)
ylabel('max error relative to a fine grid','Interpreter','latex', 'FontSize', 18)