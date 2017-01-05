function PSFout = psf_fx(din)

load PSF_coeff_fx.mat; % quantitization signed 16bit 
len = length(PSF_filtercoeff);
tmp = conv(PSF_filtercoeff,din);
PSFout = floor(tmp((len-1)/2+1:end-(len-1)/2)/2^15);% right shift 15bit