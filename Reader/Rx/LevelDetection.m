function Dout = LevelDetection(din)
% Used in the FM0 mode
global Sim
global Register

Dout = zeros(1,length(din));
if Register.TagCode == 0
    Nw = round(Sim.TagFs/Sim.Tag.BLF/Sim.ReaderDownOSR/2*3);
%     RefLevel = sum(din(1:Nw-1));
    for I=Nw:length(din)
        RefLevel = sum(din(I-Nw+1:I))/(Nw*1.2);
        if din(I)>RefLevel
            Dout(I) = din(I);
        else
            Dout(I) = 0;
        end
    end
else
    Dout = din;
    idx = find(din<0);
    Dout(idx) = 0;
end
