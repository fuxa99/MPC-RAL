clc
clear
close all

syms Ld Lq w Rs A T ys real         % definition of symbolic variables

F = (1/Rs-w*Ld*1i/(Rs^2))/(1+w^2*(Lq/Rs));
pretty(F)                       % displays the transfer function F in a clear form

Re = simplify(real(F))          % find the real part of the transfer function F
[Rs2, param2, cond2] = solve(((A*T)/2)* Re == ys,Rs,'ReturnConditions',true); % find Rs
simplify(Rs2)