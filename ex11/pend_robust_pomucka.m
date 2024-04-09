
l = 0.305;
m = 0.21;
M = 0.455;

theta0 = 10; % pocatecni uhel (nutne pouze pro simscape model)
g = 9.8;

A = [0 1 0 0;
    0 0 -m*g/M 0;
    0 0 0 1;
    0 0 (M+m)*g/l/M 0];
B = [0; 1/M; 0; -1/M/l];
C = [0 0 1 0];
D = 0;

G = ss(A,B,C,D);
G.InputName = 'F';
G.OutputName = {'angle'};
G.StateName = {'position','velocity','angle','angular velocity'};

%% Stabilizujici regulator

Sum = 

% vaha citlivostni funkce pro stab.reg.
As = 1/100;          
M = 2;            
wb = ;           

Wp = makeweight(1/As,wb,1/M);                    % vahovaci funkce (vaha) citlivostni funkce
Wp.InputName = 
Wp.OutputName = 

% vaha kompl. citlivostni funkce pro stab.reg.
At = 1.01;                          
Mt = 1/1000;                              
wt = 

Wt = makeweight(1/At,wt,1/Mt);
Wt.InputName = 
Wt.OutputName = 

nmeas = 1; % pocet merenych vystupu
ncon = 1; % pocet akcnich velicin

% Zapojeni pro syntezu stab. reg.
system = connect();

[Kstab,CL,gam] = hinfsyn(system,nmeas,ncon);

Kstab.InputName = ;
Kstab.OutputName = ;

systemS = connect();
systemT = connect();

figure
bodemag(systemS)
hold on
bodemag(systemT)
bodemag(1/Wp)
bodemag(1/Wt)

%% Polohovy regulator

SumP = sumblk();

% pridani vystupu z polohy do systemu
C = 

G = ss(A,B,C,D);
G.InputName = 'F';
G.OutputName = {'position','angle'};
G.StateName = {'position','velocity','angle','angular velocity'};

% vaha citlivostni funkce pro polohovy reg.
Ap = 1/100;       
Mp = 2;            
wbp =        

Wp = makeweight(1/Ap,wbp,1/Mp);
Wp.InputName = 
Wp.OutputName =

% At = 1.01;                          
% Mt = 1/1000;                              
% wt = 
% 
% Wt = makeweight(1/At,wt,1/Mt);
% 
% Wt.InputName = 
% Wt.OutputName = 

Kpd =  
Kpd.InputName = 
Kpd.OutputName = 

system = connect();

rng('default')
opt = hinfstructOptions('Display','final','RandomStart',5);
[sysOpt, gam] = hinfstruct(system,opt);

Kpd = getBlockValue(sysOpt,'Kpd');
Kpd.InputName = ;
Kpd.OutputName = ;

systemT = connect();
systemS = connect();

figure
bodemag(systemS)
hold on
bodemag(systemT)
bodemag(1/Wp)
bodemag(1/Wt)

