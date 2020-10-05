function [uCurr] = GaussSeidel(u)
%GaussSeidel: performs Gauss-Seidel iteration on the input matrix u.
%             Currently doesn't work

n = size(u,1) - 1;
h = 1/n;
    
uCurr = u; % current u matrix
for iter=1:1000

    if mod(iter,100) == 0
        disp(iter)
    end
    
    for x=1:n+1
        for y=1:n+1
           
            if x==1 % x = 0
                % Dirichlet boundary condition, no need to change
                continue;
                
            elseif x == (n+1) % x = 1
                % Dirichlet boundary condition, no need to change
                continue;
                
            elseif y == 1 % y = 0
                a = 2 - (3/2)*h;
                uCurr(x,y) = (1/a)*(uCurr(x-1,y) + uCurr(x+1,y) + 0.5*h*uCurr(x,y+2) - 2*h*uCurr(x,y+1));
                %uCurr(x,y) = (4/3)*uCurr(x,y+1) - (1/3)*uCurr(x,y+2);
                %uCurr(x,y) = uCurr(x,y) + (1/2)*(uCurr(x-1,y) + uCurr(x+1,y));
                continue;
                
            elseif y == (n+1) % y = 1
                a = 2 - (3/2)*h;
                uCurr(x,y) = (1/a)*(uCurr(x-1,y) + uCurr(x+1,y) + 0.5*h*uCurr(x,y-2) - 2*h*uCurr(x,y-1));
                               %uCurr(x,y) = (4/3)*uCurr(x,y-1) - (1/3)*uCurr(x,y-2);
                %uCurr(x,y) = uCurr(x,y) + (1/2)*(uCurr(x-1,y) + uCurr(x+1,y));
                continue;
                
            else % otherwise, inner point
                uCurr(x,y) = (1/4)*(  uCurr(x-1,y) + uCurr(x+1,y) ...
                                    + uCurr(x,y-1) + uCurr(x,y+1) );
            end
        end
    end
                                       
end

end

