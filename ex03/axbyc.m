function [x0,y0,b0,a0] = axbyc(a,b,c,d)

[g,p,q] = gcd(a,b,d); %respec symboic variable d

x0 = simplify(p*c/g);
y0 = simplify(q*c/g);
a0 = simplify(a/g);
b0 = simplify(b/g);

end