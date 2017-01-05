function [Dout, FrameSync, CRCflag] = Reader_Rxfx(RxAD_in)

global Sim
global Register

%% Downsampling Filter 
DFout = DownsamplingF_fx(RxAD_in);

%% Matching Filter
MF = MFGen();
MatchFilter_Out = matchfilter(DFout, MF);

%% Channle Select Filter
if Register.TagCode ~=0
    fout = CSFilterfx(MatchFilter_Out);
else
    fout = MatchFilter_Out;
end
%% Level Detecor and Peak finder
Lout = LevelDetection(fout);

% peak_flago = FindPeak(Lout);
peak_flag = FindPeak_WD(Lout);
figure(1);plot(peak_flag*max(real(DFout)),'b');hold on;plot(real(DFout),'r');
plot(MatchFilter_Out,'k');
hold off;
idx = find(peak_flag == 1);
fprintf('peak num is %d\t', numel(idx));
% diffidx = diff(idx(1:12));
% figure(2);plot(diffidx);
% keyboard;
%% Miller/FM0 Detector
if Register.TagCode ==0
    BitOut=fm0decode(peak_flag, Sim.DerrRatio);
else
    BitOut= millerdecode(peak_flag, Sim.DerrRatio, Register.TagCode);
end
%% Frame Sync
[D_payload,FrameSync] = frameSync(BitOut);
%% CRC check
CRCflag = CRC_Check(D_payload, Register.TagCRCType);

if CRCflag ~= 0
    keyboard;
end
% Dout = D_payload;
if Register.TagCRCType == 0
    Dout = D_payload(1:Sim.len+16);
else
    Dout = D_payload(1:Sim.len+5);
end

