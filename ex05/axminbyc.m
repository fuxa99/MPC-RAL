function [xmin,y]=axminbyc(a,b,c,d)
[x0,y0,a0,b0] = axbyc(a,b,c,d);

% minimum degree of polynomial x: x0 = b0u + v => x0/b0 = u + v/b0 
% quorem - Divide polynomials 
% [quotient,reminder]=quorem(polynomial_1, polynomial_2,symbolic_variable) 
[u,v] = quorem(x0,b0,d);

% solution with minimum degree of x: x = v; y = y0 + a0*u
xmin = v;
y = simplify(y0+a0*u);