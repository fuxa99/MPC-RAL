function [x0,y0,a0,b0]=axbyc(a,b,c,d)
% GCD and the solution of ap+bq = g
[g,p,q] = gcd(a,b,d);

% general solution
%       x = x0 - b0*h   =>    x = p*(c/g) - b/g*h
%       y = y0 + a0*h   =>    y = q*(c/g) + a/g*h
x0 = simplify(p*(c/g));
y0 = simplify(q*(c/g));
a0 = simplify(a/g);
b0 = simplify(b/g);