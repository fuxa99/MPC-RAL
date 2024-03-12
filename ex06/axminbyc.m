function [xmin,y]=axminbyc(a,b,c,d)
%AXMINBYC Funkce resi polynomialni rovnici ax+by=c.
%   Vraci reseni s minimalnim stupnem polynomu x. 
%   Polynomy a,b,c jsou zadané. Jejich promìnnou
%   je parametr predany jako posledni vstupni
%   parametr d.  
%   Funkce vraci dva polynomy xmin a y jako reseni.

% [x0,y0,a0,b0] = axbyc(a,b,c,d);
% [x0,y0,a0,b0] = axbyc_v2(a,b,c,d);
[x0,y0,a0,b0] = axbyc(a,b,c,d);

% minimalni stupen polynomu x: x0 = b0u + v => x0/b0 = u + v/b0
% deconv - dìlení polynomu polynomem 
% [podil,zbytek]=deconv(polynom_1, polynom_2) 
[u,v] = deconv(sym2poly(x0),sym2poly(b0));

u = poly2sym(u,d); % podil u
v = poly2sym(v,d); % zbytek v

% reseni s minimalnim stupnem x: x = v; y = y0 + a0*u
xmin = v;
y = simplify(y0+a0*u);