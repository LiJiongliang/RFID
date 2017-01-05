function gm_seq = gm_gen(OS)
gm_seq = zeros(1, OS);

for I =1:OS
    gm_seq(I) = gm_seq(I) + sin(2*pi*(2-1)*(I-1)/OS)/(2-1);
end
gm_seq = round(gm_seq*4/pi*2^8);