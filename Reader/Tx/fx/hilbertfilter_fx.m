function HilbertFout = hilbertfilter_fx(din)

load Tx_Hilbert_coeff_fx.mat;

SSB_real = conv(A_coeffs_fx,din);
SSB_imag = conv(B_coeffs_fx,din);

SSB_real = floor(SSB_real(17:end-16)/2^15);    % right shift 15bit
SSB_imag = floor(SSB_imag(17:end-16)/2^15); % right shift 15bit

HilbertFout = complex(SSB_real,SSB_imag);