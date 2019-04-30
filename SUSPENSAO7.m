function DX=SUSPENSAO7(t,X,flag,WW,u)
global Ms mr1 mr2 mr3 mr4 k1 k2 k3 k4 kp I_teta I_phi Lr Lf  Hf Hr

Zw1=WW(1,1);    
Zw2=WW(1,2);
Zw3=WW(1,3);
Zw4=WW(1,4);

Zs=X(1);
teta=X(3);
phi=X(5);
Zu1=X(7);   
Zu2=X(9);
Zu3=X(11);
Zu4=X(13);



[Zs1,Zs2,Zs3,Zs4]=ZS1234(Zs,teta,phi);
  

DX=zeros(14,1);

DX(1)=X(2);
DX(3)=X(4);
DX(5)=X(6);
DX(7)=X(8);
DX(9)=X(10);
DX(11)=X(12);
DX(13)=X(14);


DX(2)=(-1/Ms)*(k1*(Zs1-Zu1)+k2*(Zs2-Zu2)+k3*(Zs3-Zu3)+k4*(Zs4-Zu4)+u(1)+u(2)+u(3)+u(4));
DX(4)=(1/(I_teta))*((k1*(Zs1-Zu1)+k2*(Zs2-Zu2)+u(1)+u(2))*Lf+(k3*(Zs3-Zu3)+k4*(Zs4-Zu4)+u(3)+u(4))*(-Lr));
DX(6)=(1/(I_phi))*(Hf*(k1*(Zs1-Zu1)+u(1)-k2*(Zs2-Zu2)-u(2))+Hr*(k3*(Zs3-Zu3)+u(3)-k4*(Zs4-Zu4)-u(4)));
DX(8)= (1/mr1)*((k1*(Zs1-Zu1)+u(1))+(-kp*Zu1+kp*Zw1));
DX(10)=(1/mr2)*((k2*(Zs2-Zu2)+u(2))+(-kp*Zu2+kp*Zw2));
DX(12)=(1/mr3)*((k3*(Zs3-Zu3)+u(3))+(-kp*Zu3+kp*Zw3));
DX(14)=(1/mr4)*((k4*(Zs4-Zu4)+u(4))+(-kp*Zu4+kp*Zw4));
end




