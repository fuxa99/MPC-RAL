function [xmin,y] = axminbyc(a,b,c,d)
[x0,y0,b0,a0] = axbyc(a,b,c,d);
[u,v] = quorem(x0,b0,d);
xmin = simplify(v);
y = simplify(y0 + a0*u);
end