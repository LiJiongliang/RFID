function upfout = UpsamplingF(din)

load TxHBfilter.mat;

tmp = upsample(din,2);
HBf1 = conv(TxHBfilter1,tmp);

tmp = upsample(HBf1(4:end-3),2);
HBf2 = conv(TxHBfilter2,tmp);

upfout = HBf2(4:end-3);