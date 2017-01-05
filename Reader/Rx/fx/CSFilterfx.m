function ChannelSfout = CSFilterfx(din)

global Register

load RxChannelSF;
flen = 128;
% load RxChannelSF_128;
% flen = 64;
if Register.TagCode == 1
    b = b1fx;
elseif Register.TagCode  ==2
    b= b2fx;
else
    b = b3fx;
end

fout = conv(b,din);
ChannelSfout = floor(fout(flen+1:end-flen)/2^15);

