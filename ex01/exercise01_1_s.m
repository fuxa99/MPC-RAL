clc
clear
close all

syms a b c x real;  % definition of symbolic variables

[solx, param, cond] = solve(a*x^2 + b*x + c == 0,x,'ReturnConditions',true); % analytic solution of the quadratic equation
pretty(solx)

a = 1; b = -5; c = 6;   
r = double(subs(solx));   % substitution
disp(r)