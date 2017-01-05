clear all;close all;clc;
global Sim
global Register

Sim.Tag.BLFidx = 8;
Register.TagCode = 0;    
 
SimSetting;
RegisterSetting;

Simtime = 100;

        for I=1:Simtime
            fprintf('I=%d\t',I);
            din = randi(2,1,Sim.len*2)-1; 
            fprintf('din last element=%d\t',din(Sim.len));
            Tx = TagTx(din(1:Sim.len));  
            Tx_I = TagTx_I(din(Sim.len+1:2*Sim.len));

            Tx_s = Tx;
            DCoffset = DCoffsetGen(length(Tx_s));

            Rx_s = awgn(Tx_s,14,'measured');
            RxAD_in = RxMixer(Rx_s,  Sim.TagFc,  Sim.TagFs)+DCoffset;
            RxAD_in = [RxAD_in(1:end)];

            RxAD_in = round(RxAD_in*2^7);

            [Dout, FrameSync, CRCflag] = Reader_Rxfx(RxAD_in);
            fprintf('correct data num is =%d\n',sum(Dout(1:Sim.len) == din(1:Sim.len)));
            if(sum(Dout(1:Sim.len) == din(1:Sim.len))~=Sim.len)
                keyboard;
            end
        end






