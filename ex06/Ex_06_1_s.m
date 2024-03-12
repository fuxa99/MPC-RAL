clc
clear
close all

syms d
a = 1 - 0.5*d + 0.1*d^2;
b = 0.1*d^2 + 0.2*d;
c = 1;
fw = 1;

[p,q] = axminbyc(a,b,c,d)        % polynomial equation a*x + b*y = c
R1 = simplify(q/p);               % R1 = q/p
pretty(R1)

[s,r] = axminbyc(fw,b,c,d);       % polynomial equation a*x + b*y = c
R2 = simplify(r/p);               % R2 = r/p
pretty(R2)