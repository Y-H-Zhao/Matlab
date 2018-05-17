function minA= SSE( x )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
load S21_5
itho=0.3e-3;
I=13/1000;
p0=2.5064/1000;
q=1.6e-19;
ioff=7.5/1000;
iq=(I-itho-ioff)/q;
ns0=(p0/(x(4)*x(7))-x(6)*x(2)/x(3))/(x(2)/x(3)+x(5)*p0/(x(4)+x(8)*p0));
nst=(p0/(x(4)*x(7))+x(5)*x(6)*p0/(x(4)+x(8)*p0))/(x(2)+x(5)*p0*x(3)/(x(4)+x(8)*p0));
Y=1/x(7)+1/x(3)+(x(5)*(x(1)*iq-nst)*(x(5)*ns0+x(8)*(x(1)*iq-nst))-(x(5)*ns0)^3)/(x(5)*ns0+x(8)*(x(1)*iq-nst))^2;
Z=1/(x(7)*x(3))+(x(5)*(x(1)*iq-nst))/(x(7)*(x(5)*ns0+x(1)*(x(1)*iq-nst)))-((1-x(2))*(x(5)*ns0)^3)/((x(5)*ns0+x(8)*(x(1)*iq-nst))*(x(3)*(x(5)*ns0+x(8)*(x(1)*iq-nst))));
F=Z./((1i*2*pi.*f).^2+(1i*2*pi.*f).*Y+Z);
Flength=length(F);
for i=1:Flength
    F(i)=10*log10(norm(F(i)));
end
minA=norm(F-S21);
end

