function Interference_out = InterferenceGen(s,fc, fs,dB)

len = length(s);
A = 10^(dB/20)*rms(s);
Pinitial = pi/8;
Interference_out = A* exp(1j*(2*pi*fc*(1:len)./fs+Pinitial));
