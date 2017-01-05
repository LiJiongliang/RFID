function [fout] = DownsamplingF(din)

global Sim

load RxHBfilter.mat;
load RxDec3filter.mat;

switch Sim.Tag.BLFidx
    case 1 % 360/18 = 20
        tmp = conv(RxHBfilter,din);
        HBF1 = downsample(tmp(4:end-3),2);

        tmp = conv(RxDecfilter3_1,HBF1);
        HDF3_1 = downsample(tmp(5:end-4),3);

        tmp = conv(RxDecfilter3_2,HDF3_1);
        fout = downsample(tmp(4:end-3),3);
    case 2 %168/8 = 21
        tmp = conv(RxHBfilter,din);
        HBF1 = downsample(tmp(4:end-3),2);

        tmp = conv(RxHBfilter,HBF1);
        HBF2 = downsample(tmp(4:end-3),2);

        tmp = conv(RxHBfilter,HBF2);
        fout = downsample(tmp(4:end-3),2);
        
    case 3 %132/6=22
        tmp = conv(RxHBfilter,din);
        HBF1 = downsample(tmp(4:end-3),2);

        tmp = conv(RxDecfilter3_1,HBF1);
        fout = downsample(tmp(5:end-4),3);
    case 4 %72/4=18
        tmp = conv(RxHBfilter,din);
        HBF1 = downsample(tmp(4:end-3),2);

        tmp = conv(RxHBfilter,HBF1);
        fout = downsample(tmp(4:end-3),2);
    case 5 %180/9 = 20
        tmp = conv(RxDecfilter3_1,din);
        HDF3_1 = downsample(tmp(5:end-4),3);

        tmp = conv(RxDecfilter3_2,HDF3_1);
        fout = downsample(tmp(4:end-3),3);
    case 6 % 84/4 = 21
        tmp = conv(RxHBfilter,din);
        HBF1 = downsample(tmp(4:end-3),2);

        tmp = conv(RxHBfilter,HBF1);
        fout = downsample(tmp(4:end-3),2);
    case 7 % 66/3=22
        tmp = conv(RxDecfilter3_1,din);
        fout = downsample(tmp(5:end-4),3);
    case 8 %36/2=18
        tmp = conv(RxHBfilter,din);
        fout = downsample(tmp(4:end-3),2);
end