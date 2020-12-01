function [Q0] = initUpwind(xs,dx)
%initUpwind implements Eq 4 from my writeup, with the same goals. 

b = 2:length(xs);
a = 1:(length(xs) - 1);

Q0 = (1/dx)*((3/2)*(xs(b)-xs(a)) + ...
             (1/(2*pi))*( cos(2*pi*xs(a)) - cos(2*pi*xs(b))));
end

