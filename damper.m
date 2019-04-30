function [U]=damper(v);
global Ms mr1 mr2 mr3 mr4 k1 k2 k3 k4 kp I_teta I_phi Lr Lf  Hf Hr
for i=1:4
   if v(i)>0
      A0=0.00;
      A1=3082.2253;
      A2=-2099.2460;	
      A3=629.11070;	
      
      U(i)=A0+A1*v(i)+A2*(v(i)^2)+ A3*(v(i)^3);
   
   elseif v(i)<0
      A0= 0.0;
      A1=1130.6245;
      A2=1444.3003;
      A3=903.66613;
      
      U(i)=A0+A1*v(i)+A2*(v(i)^2)+ A3*(v(i)^3);
   end 
end
end




