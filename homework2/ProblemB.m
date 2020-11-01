% This script answers the question in Problem B of Assignment 2.

clear;

found = false;
N = 10;
while ~found
    N = N + 1;
    xs = (1/N)*(0:N); % Create a grid x_j = jh with h=1/N and 0<=j<=N
    
    found = true;
    
    for i=1:N
        a = xs(i);
        b = xs(i+1);
        
        slope = (Fx(b) - Fx(a))/(b-a);
        critFunction = @(x) FPrimex(x) - slope;
        
        % Either fzero will find a critical point within this interval, or
        % we'll ignore it and double-check our work at the end.
        try 
            maxErrorPoint = fzero(critFunction, [a, b]);
        catch ME
        if strcmp(ME.identifier, 'MATLAB:fzero:ValuesAtEndPtsSameSign')
            %fzero couldn't find a critical point. Skip the issue here
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
        
    % Try fzero to see if we can find a critical point
    try 
        maxErrorPoint = fzero(critFunction, [a, b]);
    catch ME
        if strcmp(ME.identifier, 'MATLAB:fzero:ValuesAtEndPtsSameSign')
            % then fzero didn't find a critical point because
            % critFunction(a) had the same sign as critFunction(b).
            h = 1/(10^(4) * (400 + abs(slope))); 
            linValue = interp1(xs, Fx(xs), a:h:b);
            tmp = abs(linValue - Fx(a:h:b));
            if ~(tmp < 10^(-2))
                disp('faulty! This is not the right N')
                disp(max(tmp));
                break;
            end
            if max(tmp) > maxError
                maxError = max(tmp);
            end
            
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
            %disp('Values at end points matched in N-1: possible issue');
            h = 1/(10^(4) * (400 + abs(slope)));
            linValue = interp1(xs, Fx(xs), a:h:b);
            tmp = abs(linValue - Fx(a:h:b));
            
            if max(tmp) > maxError
                maxError = max(tmp);
            end
            continue
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


