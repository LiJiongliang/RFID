function upfout = UpsamplingF_fx(din)

load Tx_HBF_fx.mat;

tmp = upsample(din,2);
HBf1 = conv(TxHBfilter1_fx,tmp);
HBf1 = floor(HBf1/2^15);

tmp = upsample(HBf1(4:end-3),2);
HBf2 = conv(TxHBfilter2_fx,tmp);
HBf2 = floor(HBf2/2^15);


upfout = HBf2(4:end-3);