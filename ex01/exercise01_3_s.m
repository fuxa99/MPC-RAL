clc
clear
close all

syms Ld Rs Lq K T s real     	% definition of symbolic variables 

F = Rs^2*Lq/(Ld^2*s)/(Rs^2*Lq/Ld+Rs^3*Lq/(Ld^2*s));
F = simplify(F)                 % simplification of the transfer function F
[Fnum,Fden] = numden(F)         % obtain of the numerator and denominator 

Fnum = Fnum/Rs                  % conversion of the transfer function to form K/(T*s + 1)
Fden = collect(Fden/Rs,s)

tau = solve(Fden == (T*s+1),T)  % solution of equation (T*s + 1) = (Ld/Rs*s + 1) 
Ld_v = solve(tau == T,Ld)       % calculation of Ld