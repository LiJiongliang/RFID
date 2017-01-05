function DCoffset = DCoffsetGen(len)
% dcoffset = A*exp(-Bt)*exp(-j(Wd*t+phase))

global Sim
% clear all;close all;clc;
Ts= 1/Sim.TagFs;
A = 1.5;
Tb = 1/(320e3/5);
B = Ts/Tb*180*80000;%damping factor
Wd = 1/(Tb*2); %osilate factor
% len = 8786;
DCoffset = A.*exp(-B*(1:len)*Ts).*...
    exp(-1j*(Wd*(1:len)*Ts));
% DCoffset = A.*exp(-B*(1:len)*Sim.TagFs);
%     exp(-1j*(Wd*(1:len)*Sim.TagFs));
% plot(real(DCoffset));