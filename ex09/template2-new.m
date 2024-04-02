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
%sisotool(G)

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

