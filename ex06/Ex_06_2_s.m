clc
clear
close all

syms d
a = 1 - 0.5*d + 0.1*d^2;
b = 0.1*d^2 + 0.2*d;
bminus = d;
bplus = 0.1*(d + 2);
c = 1;
fw = 1;
gw = 1 + d + d^2 + d^3 + d^4;

        
[x,q] = axminbyc(a,bminus,c,d);           
p = x*bplus;
R1 = simplify(q/(p));               
pretty(R1)

[s,r] = axminbyc(fw,bminus,c,d);      
R2 = simplify(r/p);                   
pretty(R2)