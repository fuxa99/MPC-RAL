 %% Task 4
close all;
clear all;

interval = [
    38, 58; % a0 min,max
    25, 39; % a1 min,max
    8, 12;
    1, 1;
    0, 0;
    0, 0;
    0, 0]; % a2 min,max

figure;
hold on;

w = 0:0.1:5;
omega = 1:1:length(interval(:,1));
omega_vec = 1*1j.^omega;
cmap = parula(length(w));

K14 = interval(1,1) + interval(2,1)*1j.*w + interval(3,2)*1j^2*w.^2 + interval(4,2)*1j^3*w.^3 + interval(5,1)*1j^4*w.^4 + interval(6,1)*1j^5*w.^5 + interval(7,2)*1j^6*w.^6;
K24 = interval(1,2) + interval(2,2)*1j.*w + interval(3,1)*1j^2*w.^2 + interval(4,1)*1j^3*w.^3 + interval(5,2)*1j^4*w.^4 + interval(6,2)*1j^5*w.^5 + interval(7,1)*1j^6*w.^6;
K34 = interval(1,2) + interval(2,1)*1j.*w + interval(3,1)*1j^2*w.^2 + interval(4,2)*1j^3*w.^3 + interval(5,2)*1j^4*w.^4 + interval(6,1)*1j^5*w.^5 + interval(7,1)*1j^6*w.^6; 
K44 = interval(1,1) + interval(2,2)*1j.*w + interval(3,2)*1j^2*w.^2 + interval(4,1)*1j^3*w.^3 + interval(5,1)*1j^4*w.^4 + interval(6,2)*1j^5*w.^5 + interval(7,2)*1j^6*w.^6; 

X = [real(K14)',real(K34)',real(K24)',real(K44)',real(K14)'];
Y = [imag(K14)',imag(K34)',imag(K24)',imag(K44)',imag(K14)'];

colororder(cmap)
line(X',Y');

%% Task 5
clear all;
interval = [
    0.45, 0.55; % a0 min,max
    1.95, 2.05; % a1 min,max
    2.95, 3.05;
    5.95, 6.05;
    3.95, 4.05;
    3.95, 4.05;
    1, 1]; % a2 min,max


w = 0:0.001:1;
cmap = jet(length(w));
figure;
hold on;

K14 = interval(1,1) + interval(2,1)*1j.*w + interval(3,2)*1j^2*w.^2 + interval(4,2)*1j^3*w.^3 + interval(5,1)*1j^4*w.^4 + interval(6,1)*1j^5*w.^5 + interval(7,2)*1j^6*w.^6;
K24 = interval(1,2) + interval(2,2)*1j.*w + interval(3,1)*1j^2*w.^2 + interval(4,1)*1j^3*w.^3 + interval(5,2)*1j^4*w.^4 + interval(6,2)*1j^5*w.^5 + interval(7,1)*1j^6*w.^6;
K34 = interval(1,2) + interval(2,1)*1j.*w + interval(3,1)*1j^2*w.^2 + interval(4,2)*1j^3*w.^3 + interval(5,2)*1j^4*w.^4 + interval(6,1)*1j^5*w.^5 + interval(7,1)*1j^6*w.^6; 
K44 = interval(1,1) + interval(2,2)*1j.*w + interval(3,2)*1j^2*w.^2 + interval(4,1)*1j^3*w.^3 + interval(5,1)*1j^4*w.^4 + interval(6,2)*1j^5*w.^5 + interval(7,2)*1j^6*w.^6; 

X = [real(K14)',real(K34)',real(K24)',real(K44)',real(K14)'];
Y = [imag(K14)',imag(K34)',imag(K24)',imag(K44)',imag(K14)'];

colororder(cmap)
line(X',Y');

%% Task 6 / Model of the Mass/damper/spring system

m = 3;
c = 1;
k = 2;
pm = 0.2; %4
pc = 0.4; %2
pk = 0.2; %3

A = % fill in the system matrix A (relations between x and its derivatives)
Bw = % exogenous input matrix Bw 
Bu = % control input matrix Bu 
Cz = % optimized outputs matrix Cz 
Cy = % measured outputs matrix Cy 
Dwz = % exogenous inputs w to optimized outputs z
Duz = % control inputs u to optimalized outputs z
Dwy = % exogenous inputs w to measured outputs y
Duy = % control inputs u to measured outputs y

G = pck(); % put A, B, C, D matrices as parameters (B, C and D matrices have to be put together from Bw, Bu, Cz, Cy, Dwz, Duz, Dwy, Duy matrices)
% hint: 
%               |dot{x}|        |x|
%               |  z   |  = G * |w|
%               |  y   |        |u|


% Frequency response of a system with uncertainties:
omega = logspace(-1,1,100);
nunct = 3;
unctbode(G,omega,nunct)
subplot(2,1,1)
title('BODE PLOTS OF PERTURBED PLANTS')