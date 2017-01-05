function peak_flag = FindPeak(din)

peak_flag = zeros(size(din));

for I = 2:length(din)-1
    deltaU = din(I) - din(I-1);
    deltaD = din(I+1) - din(I);
    if deltaU>0 && deltaD<=0
        peak_flag(I) = 1;
    end
end
