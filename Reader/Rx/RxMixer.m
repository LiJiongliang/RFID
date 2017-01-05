function Rxmixer_out = RxMixer(s, fc, fs)

len = length(s);
Pinitial = pi/12;
Rxmixer_out = s.* exp(1j*(2*pi*fc*(1:len)./fs+Pinitial));
