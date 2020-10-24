% This script answers the question in Problem B of Assignment 2.

clear;

found = false;
N = 10;
while ~found
    disp(N)
    N = N + 1;
    xs = (1/N)*(0:N); % Create a grid x_j = jh with h=1/N and 0<=j<=N
    
    found = true;
    
    for i=1:N
        a = xs(i);
        b = xs(i+1);
        
        slope = (Fx(b) - Fx(a))/(b-a);
        critFunction = @(x) FPrimex(x) - slope;
        
        % Either there is a critical point within this interval, or the max
        % error is at an endpoint (which would mean the error is 0).
        try 
            maxErrorPoint = fzero(critFunction, [a, b]);
        catch ME
        if strcmp(ME.identifier, 'MATLAB:fzero:ValuesAtEndPtsSameSign')
            %error is 0, so continue
            continue;
        end
        rethrow(ME) % otherwise, we have a different issue!
        end
        
        linValue = interp1(xs, Fx(xs), maxErrorPoint);
        if abs(linValue - Fx(maxErrorPoint)) > 10^(-2)
            found = false;
            break;
        end
        
    end
end

disp("The value of N is: ");
disp(N);

% test for current value N: what is the maximum error?
xs = (1/N)*(0:N);
maxError = 0;
for i=1:N
    a = xs(i);
    b = xs(i+1);
        
    slope = (Fx(b) - Fx(a))/(b-a);
    critFunction = @(x) FPrimex(x) - slope;
        
    % Either there is a critical point within this interval, or the max
    % error is at an endpoint (which would mean the error is 0).
    try 
        maxErrorPoint = fzero(critFunction, [a, b]);
    catch ME
        if strcmp(ME.identifier, 'MATLAB:fzero:ValuesAtEndPtsSameSign')
            disp('Values at end points matched in N: possible issue');
            disp(a);
            disp(b);
            disp(critFunction(a));
            disp(critFunction(b));
            linValue = interp1(xs, Fx(xs), a:0.00001:b);
            tmp = abs(linValue - Fx(a:0.00001:b));
            if ~(tmp < 10^(-2))
                disp('faulty!')
                disp(max(tmp));
            end
            %disp(linValue - Fx(a:0.00001:b));
            %error is 0, so continue
            continue;
        end
        rethrow(ME) % otherwise, we have a different issue!
    end
        
    linValue = interp1(xs, Fx(xs), maxErrorPoint);
    if abs(linValue - Fx(maxErrorPoint)) > maxError
        maxError = abs(linValue - Fx(maxErrorPoint));
    end
        
end

disp('Max error for N: ')
disp(maxError)


% test for previous value N: what is the maximum error?
N = N - 1;
xs = (1/N)*(0:N);
maxError = 0;
for i=1:N
    a = xs(i);
    b = xs(i+1);
        
    slope = (Fx(b) - Fx(a))/(b-a);
    critFunction = @(x) FPrimex(x) - slope;
        
    % Either there is a critical point within this interval, or the max
    % error is at an endpoint (which would mean the error is 0).
    try 
        maxErrorPoint = fzero(critFunction, [a, b]);
    catch ME
        if strcmp(ME.identifier, 'MATLAB:fzero:ValuesAtEndPtsSameSign')
            disp('Values at end points matched in N-1: possible issue');
            %error is 0, so continue
            continue;
        end
        rethrow(ME) % otherwise, we have a different issue!
    end
        
    linValue = interp1(xs, Fx(xs), maxErrorPoint);
    if abs(linValue - Fx(maxErrorPoint)) > maxError
        maxError = abs(linValue - Fx(maxErrorPoint));
    end
        
end
disp('Max error for N-1: ')
disp(maxError)


