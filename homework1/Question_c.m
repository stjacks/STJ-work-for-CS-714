clear;
disp(['Hello! This will take a while to run. Why don''t you get ', ...
      'yourself a cup of tea?']);

initial = setup(2^11); % 512 points
actual = GaussSeidel(initial);

disp('finished numerical approximation of final answer');

exponents = 2:9;
numPoints = 2.^exponents;
hs = 1./numPoints;
err = 1:length(exponents); % error for each of the tests. To be filled in.

for i=1:length(exponents)
    init = setup(numPoints(i));
    guess = GaussSeidel(init);
    err(i) = maxExactError(guess, hs(i));
    %err(i) = maxError(guess, actual);
end
disp(err)

% Plotting the results. See "convergence_direct_solver.m" provided by
% the professor for source.
figure(1); clf();
loglog(hs,err,'o-', 'LineWidth', 2)
hold on; 
%loglog(hs, hs.^2, 'LineStyle', '-')

ax = gca;
ax.YAxis.FontSize = 13;
ax.XAxis.FontSize = 13;

title('Error', 'FontSize', 24);
xlabel('$h$','Interpreter','latex', 'FontSize', 24)
ylabel('relative max error','Interpreter','latex', 'FontSize', 24)


%lgd = legend("error", "$\mathcal{O}(h^2)$",'FontSize', 24,...
%       'Interpreter','latex');
%lgd.Location = 'northwest';

