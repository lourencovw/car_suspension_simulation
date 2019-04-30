clear all;
close all;
%%%%%% Change parameters
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

% Simulation set up

dt=1/200;
t=0:dt:12;

% Bump
v=10; % Speed in m/s


A1=0.28;
init1=594;
fim1=606;

Last=length(t)-1;
T=(Lr+Lf)/v;
N=round(T/dt);

w1=zeros(1,length(t)-1);
w3=zeros(1,length(t)-1);

%%%% First Bump
for jj=1:length(t)
    
    if (jj>init1) && (jj<fim1)
        w3(jj)=A1*sin(((t(jj)-t(init1))/(t(fim1)-t(init1)))*pi);

    end
    ii=jj+50;
    if (jj>init1) && (jj<fim1)
        w1(ii)=A1*sin(((t(jj)-t(init1))/(t(fim1)-t(init1)))*pi);

    end
end

w2=w1;
w4=w3;

init1=1194;
fim1=1206;
init2=1197;
fim2=1203;
A1=0.28;
A2=-0.15;

%%%% Second Bump
for jj=1:length(t)
    
    if (jj>init1) && (jj<fim1)
        w3(jj)=A1*sin(((t(jj)-t(init1))/(t(fim1)-t(init1)))*pi);

    end
    ii=jj+50;
    if (jj>init1) && (jj<fim1)
        w1(ii)=A1*sin(((t(jj)-t(init1))/(t(fim1)-t(init1)))*pi);

    end
    
    
    
    if (jj>init2) && (jj<fim2)
        w4(jj)=A2*sin(((t(jj)-t(init2))/(t(fim2)-t(init2)))*pi);

    end
    ii=jj+50;
    if (jj>init2) && (jj<fim2)
        w2(ii)=A2*sin(((t(jj)-t(init2))/(t(fim2)-t(init2)))*pi);

    end
end

init1=1797;
fim1=1803;
init2=1794;
fim2=1806;
A1=-0.15;
A2=0.28;

%%%% Third Bump
for jj=1:length(t)
    
    if (jj>init1) && (jj<fim1)
        w3(jj)=A1*sin(((t(jj)-t(init1))/(t(fim1)-t(init1)))*pi);

    end
    ii=jj+50;
    if (jj>init1) && (jj<fim1)
        w1(ii)=A1*sin(((t(jj)-t(init1))/(t(fim1)-t(init1)))*pi);

    end
    
    
    
    if (jj>init2) && (jj<fim2)
        w4(jj)=A2*sin(((t(jj)-t(init2))/(t(fim2)-t(init2)))*pi);

    end
    ii=jj+50;
    if (jj>init2) && (jj<fim2)
        w2(ii)=A2*sin(((t(jj)-t(init2))/(t(fim2)-t(init2)))*pi);

    end
end

WW =[ w1 ;  w2 ;  w3 ;  w4]';


figure(1);

subplot(2,1,1);
plot(t(1:length(w1)),w1,'r');hold on;plot(t(1:length(w1)),w3,'g');
subplot(2,1,2);
plot(t(1:length(w1)),w2,'r');hold on;plot(t(1:length(w1)),w4,'g');


save road.mat WW  