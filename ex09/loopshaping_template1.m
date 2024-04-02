%% Task 1 - H-infinity loopshaping of generic 2nd order system
clear all;
close all;

s=tf('s');
% Transfer function of the given system
G=1/(0.0025*s^2+0.06*s+1);
% Pre-compensator from sisotool
W1= 0.56879*(s+17.01)/s;%%%
W2=1; % generaly the post-compensator is 1 (no need to change this line)

figure(1)

% Open loop freq. char. of compensated plant
bodemag(G*W1);


% Robust controller synthesis using the plant and compensator
% type help ncfsyn for more info
[Kfinal,CL,GAM,INFO]=ncfsyn(G,W1,W2);

% Implementation diagram requires the gain of controller at w=0, following
% function returns gain at specific freq
% Hint: use the info structure to get the controller alone,
% don't use Kfinal, because Kfinal = Ks*W1
Ksstatic = freqresp(tf(INFO.Ks),0);
 
% Feedback just with compensator alone
% Use help feedback for more info
% Hint: use negative feedback here, just like with any other controller
S0 = feedback(W1*G,-1,1);

% Feedback with compensators and robust controller (referred to as
% complementary sensitivity function in robust control or setpoint transfer 
% function in control theory)
% Hint 1: use POSITIVE!!! feedback here, implementation diagram requires it
% for this type of controller
% Hint 2: use negative sign to get correct step response (just like in the
% implementation diagram
T = -Ksstatic * feedback(W1*G,W2*tf(INFO.Ks),1);
% Sensitivity function (also known as control error transfer function)
% neuvazuje se Ks pred funkci
S = feedback(1,W1*G*W2*tf(INFO.Ks),1);

figure(2)
step(S)
hold on
step(T)
step(S0)
legend("S","T","S0");
hold off

%% Task 2 - H-infinity loopshaping of an MDS state-space system with uncertainties
%% Uncertain state-space model of MDS
mnom = 3;
cnom = 1;
knom = 2;
pm = 0.4; % max deviation from nominal value 0.4 = 40%
pc = 0.4; %
pk = 0.3; %

% definitions of uncertain parameters
m = ureal('mass',mnom,'Plusminus',pm);
c = ureal('friction',cnom,'Plusminus',pc);
k = ureal('elasticity',knom,'Plusminus',pk);

% system matrices with uncertain parameters
A = [  0     1
     -k/m  -c/m];
B = [0;
      1/m];
C = [1 0];

D = [0];

% Use uss function to form uncertain state space description
Gunct = uss(A,B,C,D);

% Frequency response of the uncertain system
omega = logspace(-1,1,100);
figure(3)
bodemag(Gunct,omega)
title('Bode plots of uncertain plant')

% Loopshaping design procedure

% Open sisotool with the system G
% sisotool will automaticaly select nominal plant (it doesn't suport uss)
% DOESN'T WORK INSIDE E-LEARNING!!! Open in MATLAB
sisotool(G)

% Transfer compensator coeficients from sisotool
W1num = %%%;
W1den = %%%;
W1gain = %%%;
W1 = W1gain*tf(W1num,W1den);


% Form open loop and check the frequency response
L = W1*Gunct;
figure(4)
bode(L,omega)

% Controller synthesis using uncertain plant Gss and compensator W1
% type help ncfsyn for more info
[Kfinal,CL,GAM, INFO] = ncfsyn(%%%);


% Get the controller gain for zero frequency
K0 = freqresp(%%%);

% Implement the control feedback loop using uncertain model and robust
% controller
Tunct = %%%*feedback(%%%);
T2 = feedback(%%%);
figure(5)
step(Tunct)

