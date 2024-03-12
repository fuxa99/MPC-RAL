function [x0,y0,a0,b0]=axbyc_2015b(a,b,c,d)
%AXBYC Funkce resi polynomialni rovnici ax+by=c.
%   Polynomy a,b,c jsou zadané. Jejich promìnnou
%   je symbolicka promenna predana jako posledni vstupni
%   parametr d.  
%   Vraci ctyri polynomy x0,y0,a0,b0, ze kterych se da urcit
%   obecne reseni:
%       x = x0 - b0*h
%       y = y0 + a0*h
%   kde h je libovolny polynom.


% nejvetsi spolecny delitel a reseni ap + bq = g
[g,p,q] = gcd(a,b,d);

% obecne reseni
%       x = x0 - b0*h   =>    x = p*(c/g) - b/g*h
%       y = y0 + a0*h   =>    y = q*(c/g) + a/g*h
x0 = simplify(p*(c/g));
y0 = simplify(q*(c/g));
a0 = simplify(a/g);
b0 = simplify(b/g);