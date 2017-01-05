clear all;close all;clc;

global Sim
global Register

SimSetting;
RegisterSetting;

len = 32;
Txdin = randi(2,1,len)-1; %
% Txdin = zeros(2,1,len);

Tx_s = Reader_Tx(Txdin);
Tx_s_fx = Reader_Txfx(Txdin);

if Register.ReaderMod == 0
    figure(1);plot(real(Tx_s(1:end)),'b');plot(real(Tx_s_fx(1:end)),'r');hold off;
end
[fb1, fr1]=spectrum_analyzer(Tx_s(1:end),Sim.Reader.DAClk/4 , Sim.Reader.DAClk/4/length(Tx_s), Sim.Reader.DAClk/4/length(Tx_s));
[fb2, fr2]=spectrum_analyzer(Tx_s_fx(1:end),Sim.Reader.DAClk/4 , Sim.Reader.DAClk/4/length(Tx_s_fx), Sim.Reader.DAClk/4/length(Tx_s_fx));

figure(2);plot(fr1,fb1,'b');grid on;hold on;
plot(fr2,fb2,'r');hold off;