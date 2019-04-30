clc
clear all
close all
global Ms mr1 mr2 mr3 mr4 k1 k2 k3 k4 kp I_teta I_phi Lr Lf  Hf Hr

load road.mat
load results_car.mat

figure(1);
subplot(211)
plot(t,Zw1(1:length(t)),'b');
subplot(212)
plot(t,Zw2(1:length(t)),'b');

figure (2);
subplot(211)
plot(t,Zw1(1:length(t)),'b');
hold on;
plot(t,Zw2(1:length(t)),'b');
hold on;
plot(t,YY(1:length(t),7)','r');
hold on;
plot(t,YY(1:length(t),9)','r');
ylabel('Zw1/Zw2/Zu1/Zu2 [m]')
xlabel('Time [s]')
subplot(212)
plot(t,Zw3(1:length(t)),'b');
hold on;
plot(t,Zw4(1:length(t)),'b');
hold on;
plot(t,YY(1:length(t),11)','r');
hold on;
plot(t,YY(1:length(t),13)','r');
ylabel('Zw3/Zw4/Zu3/Zu4 [m]')
xlabel('Time [s]')


figure(3)
plot(t,YY(1:length(t),1)')
ylabel('Zgc [m]')
xlabel('Time [s]')


figure(4)
subplot(211)
plot(t,YY(1:length(t),11)')
ylabel('Right Front wheel (Zw3) [m]')
subplot(212)
plot(t,YY(1:length(t),13)')
ylabel('Left Front Wheel (Zw4) [m]')
xlabel('Time [s]')


figure(5)
plot(t,(180/pi)*YY(1:length(t),7)');
ylabel('Pitch [°]')
xlabel('Time [s]')
