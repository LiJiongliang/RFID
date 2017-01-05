function [fout] = DownsamplingF_fx(din)

global Sim

load RxHBfilter_fx.mat;
load RxDec3filter_fx.mat;

switch Sim.Tag.BLFidx
    case 1 % 360/18 = 20
        tmp = conv(RxHBfilter_fx,din);
        HBF1 = downsample(floor(tmp(4:end-3)/2^15),2);

        tmp = conv(RxDecfilter3_1_fx,HBF1);
        HDF3_1 = downsample(floor(tmp(5:end-4)/2^15),3);

        tmp = conv(RxDecfilter3_2_fx,HDF3_1);
        fout = downsample(floor(tmp(4:end-3)/2^15),3);
    case 2 %168/8 = 21
        tmp = conv(RxHBfilter_fx,din);
        HBF1 = downsample(floor(tmp(4:end-3)/2^15),2);

        tmp = conv(RxHBfilter_fx,HBF1);
        HBF2 = downsample(floor(tmp(4:end-3)/2^15),2);

        tmp = conv(RxHBfilter_fx,HBF2);
        fout = downsample(floor(tmp(4:end-3)/2^15),2);
        
    case 3 %132/6=22
        tmp = conv(RxHBfilter_fx,din);
        HBF1 = downsample(floor(tmp(4:end-3)/2^15),2);

        tmp = conv(RxDecfilter3_1_fx,HBF1);
        fout = downsample(floor(tmp(5:end-4)/2^15),3);
    case 4 %72/4=18
        tmp = conv(RxHBfilter_fx,din);
        HBF1 = downsample(floor(tmp(4:end-3)/2^15),2);

        tmp = conv(RxHBfilter_fx,HBF1);
        fout = downsample(floor(tmp(4:end-3)/2^15),2);
    case 5 %180/9 = 20
        tmp = conv(RxDecfilter3_1_fx,din);
        HDF3_1 = downsample(floor(tmp(5:end-4)/2^15),3);

        tmp = conv(RxDecfilter3_2_fx,HDF3_1);
        fout = downsample(floor(tmp(4:end-3)/2^15),3);
    case 6 % 84/4 = 21
        tmp = conv(RxHBfilter_fx,din);
        HBF1 = downsample(floor(tmp(4:end-3)/2^15),2);

        tmp = conv(RxHBfilter_fx,HBF1);
        fout = downsample(floor(tmp(4:end-3)/2^15),2);
    case 7 % 66/3=22
        tmp = conv(RxDecfilter3_1_fx,din);
        fout = downsample(floor(tmp(5:end-4)/2^15),3);
    case 8 %36/2=18
        tmp = conv(RxHBfilter_fx,din);
        fout = downsample(floor(tmp(4:end-3)/2^15),2);
end