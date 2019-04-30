
function [Us]=satura(u)
global Ms mr1 mr2 mr3 mr4 k1 k2 k3 k4 kp I_teta I_phi Lr Lf  Hf Hr
Linf=-1500; 
Lsup= 1500;

for i=1:4
   if u(i)-Linf<=1e-5
      u(i)=Linf;
   end
end

for i=1:4
   if u(i)-Lsup>=1e-5
      u(i)=Lsup;
   end
end   
Us=u;
end