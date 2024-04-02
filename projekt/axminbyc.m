function [xmin,y]=axminbyc(a,b,c,d)
%AXMINBYC Funkce resi polynomialni rovnici ax+by=c.
%   Vraci reseni s minimalnim stupnem polynomu x. 
%   Polynomy a,b,c jsou zadané. Jejich proměnnou
%   je parametr predany jako posledni vstupni
%   parametr d.  
%   Funkce vraci dva polynomy xmin a y jako reseni.

[x0,y0,a0,b0] = axbyc(a,b,c,d);

% minimalni stupen polynomu x: x0 = b0u + v => x0/b0 = u + v/b0
% quorem - dělení polynomu polynomem 
% [podil,zbytek]=quorem(polynom_1, polynom_2,symbolicka_promenna) 
[u,v] = quorem(x0,b0,d);

% reseni s minimalnim stupnem x: x = v; y = y0 + a0*u
xmin = v;
y = simplify(y0+a0*u);
