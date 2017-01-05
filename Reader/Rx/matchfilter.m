function MatchFilter_Out = matchfilter(din, mf)
global Register

if Register.TagCode == 0
    Re_Dm = floor(conv(real(din),fliplr(mf(1,:)))/2^8);
    Im_Dm = floor(conv(imag(din),fliplr(mf(1,:)))/2^8);
    MatchFilter_Out = abs(Re_Dm) + abs(Im_Dm);
else
    Re_D0 = conv(real(din),fliplr(mf(1,:)));
    Re_D1 = conv(real(din),fliplr(mf(2,:)));

    Im_D0 = conv(imag(din),fliplr(mf(1,:)));
    Im_D1 = conv(imag(din),fliplr(mf(2,:)));

    MatchFilter_Out = abs(Re_D1) + abs(Im_D1) - ...
                                    abs(Im_D0) - abs(Re_D0);
end
MatchFilter_Out = MatchFilter_Out(floor(size(mf,2)/2)+1:...
    floor(size(mf,2)/2)+length(din));