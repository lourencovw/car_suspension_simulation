% Analysis of suspension system using MATLAB %
close all;
clear all;
clc;

global Ms mr1 mr2 mr3 mr4 k1 k2 k3 k4 kp I_teta I_phi Lr Lf  Hf Hr 

Ms=1100;  % Kg
mr1=20;    % Kg
mr2=20;    % Kg

mr3=30;    % Kg
mr4=30;    % Kg
k1=20000; % N/m
k2=20000; % N/m
k3=15000; % N/m
k4=15000; % N/m
kp=150000;% N/m
I_teta=310; % N m s^2
I_phi=310;  % N m s^2
Lr=1.5; % m
Lf=1; % m
Hr=0.625; % m
Hf=0.625; % m 

load road.mat

dt=1/200;
t=0:dt:12;

% Bumps+holes in the road

Zw1=WW(:,1);
Zw2=WW(:,2);
Zw3=WW(:,3);
Zw4=WW(:,4);


% Initial conditions

teta=0.01*pi/180;
Zs=0.01;
phi=0.01*(pi/180);
[Zs1,Zs2,Zs3,Zs4]=ZS1234(Zs,teta,phi);
% Static balancing

Zu1=(kp*Zw1(1)+k1*Zs1)/(k1+kp);
Zu2=(kp*Zw2(2)+k2*Zs2)/(k2+kp);
Zu3=(kp*Zw3(3)+k2*Zs3)/(k3+kp);
Zu4=(kp*Zw4(4)+k2*Zs4)/(k4+kp);
WW=[Zw1 Zw2 Zw3 Zw4];

desloc_ant1=Zs1-Zu1;
desloc_ant2=Zs2-Zu2;
desloc_ant3=Zs3-Zu3;
desloc_ant4=Zs4-Zu4;

X0= [Zs 0 teta 0 phi 0 Zu1 0 Zu2 0 Zu3 0 Zu4 0]';

% Initialization of Variable History Storage Vectors

YY=X0';
U0=[0 0 0 0]'; % u1 e u2 - non-linear damping forces
U=[U0'];
Time=[];
Desloca=[]; 
Veloci =[];

opts = odeset('RelTol',1e-2,'AbsTol',1e-4);

for jj=2:length(WW)

    [T,X] = ode45('SUSPENSAO7',[t(jj) t(jj+1)],X0,opts,WW(jj,:),U0);

    X=X(size(X,1),:)';
    X0=X;
    YY=[YY; X0'];     % STORAGE OF THE STATES RECORD
    Time=[Time;t(jj)];% STORAGE OF THE TIME'S RECORD

    Zs=X(1);    
    teta=X(3);
    phi=X(5);
    Zu1=X(7);
    Zu2=X(9);
    Zu3=X(11);
    Zu4=X(13);

    [Zs1,Zs2,Zs3,Zs4]=ZS1234(Zs,teta,phi); 
 
    desloc1=Zs1-Zu1;
    desloc2=Zs2-Zu2;
    desloc3=Zs3-Zu3;
    desloc4=Zs4-Zu4;

    % Computational relative speed calculation
    
    VELrelz1=(desloc1-desloc_ant1)/dt; 
    VELrelz2=(desloc2-desloc_ant2)/dt;
    VELrelz3=(desloc3-desloc_ant3)/dt;
    VELrelz4=(desloc4-desloc_ant4)/dt;
    veloci=[VELrelz1 VELrelz2 VELrelz3 VELrelz4];
    
    % calculation of non-linear damping force

    UL=damper(veloci);
    Us=satura(UL); 
    U0=Us';
  
    desloc_ant1=desloc1;
    desloc_ant2=desloc2;
    desloc_ant3=desloc3;
    desloc_ant4=desloc4;
    
    desloca=[desloc_ant1 desloc_ant2 desloc_ant3 desloc_ant4 ];
 
    Desloca=[Desloca; desloca];
    Veloci =[Veloci; veloci];
    U=[U ; U0'];

end


t=Time;

save results_car.mat YY U Zs  t Zw1 Zw2 Zw3 Zw4  Ms mr1 mr2 mr3 mr4 k1 k2 k3 k4 kp I_teta  I_phi Lr Lf  Hf Hr 

plot_results

load handel
sound(y,Fs)



