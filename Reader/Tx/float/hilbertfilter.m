function HilbertFout = hilbertfilter(din)

load IQfilterOSR9.mat;

SSB_real = conv(A_coeffs,din);
SSB_imag = conv(B_coeffs,din);

SSB_real = SSB_real(17:end-16);
SSB_imag = SSB_imag(17:end-16);
HilbertFout = complex(SSB_real,SSB_imag);