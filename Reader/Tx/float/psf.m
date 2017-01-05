function PSFout = psf(din,OSd)

N = 4;
alpha = 1;
Filterorder = OSd*N;
h = firrcos(Filterorder,0.08,alpha,1,'rolloff','normal',Filterorder/2,...
    kaiser(Filterorder+1,0.5));
Hd = dfilt.df1(h/sum(h),1);
FilterCoeff = Hd.Numerator;
tmp = conv(FilterCoeff,din);
PSFout = tmp(OSd*N/2+1:end-OSd*N/2);