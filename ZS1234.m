
function [Zs1,Zs2,Zs3,Zs4]=ZS1234(Zs,teta,phi) 
global Ms mr1 mr2 mr3 mr4 k1 k2 k3 k4 kp I_teta I_phi Lr Lf  Hf Hr


%%%%%%%% Positions %%%%%%%%
Zs1 =-sin(teta)*Lf-(cos(teta)*sin(phi))*Hf+Zs;
 
Zs2 =-sin(teta)*Lf+(cos(teta)*sin(phi))*Hf+Zs;

Zs3 = sin(teta)*Lr-(cos(teta)*sin(phi))*Hr+Zs;

Zs4 = sin(teta)*Lr+(cos(teta)*sin(phi))*Hr+Zs;
end