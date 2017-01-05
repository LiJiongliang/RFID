function fm0=fm0decode(peak_flag, DerrRatio)

global Sim
TH_st =  round(Sim.TagFs/Sim.Tag.BLF/Sim.ReaderDownOSR/2);
TH_lt =  round(Sim.TagFs/Sim.Tag.BLF/Sim.ReaderDownOSR);
% din = [0 din];
len = length(peak_flag);

Co = 0; % old counter
Cn = 0; % new counter
Cl = []; % long width pulse counter seq for debug
Cs = []; % short width pulse counter seq for debug
fm0 = [];
firsttime = 1;
for I=1:len
    if (peak_flag(I) == 1) % it is edge
        if firsttime == 1
            firsttime = 0;
            continue;
        end
        if(Cn<=round(TH_lt*(1+DerrRatio)) && Cn>=round(TH_lt*(1-DerrRatio))) % it is the wider pulse
            if (Co<=round(TH_st*(1+DerrRatio)) && Co>=round(TH_st*(1-DerrRatio)))
                fm0 = [fm0 0];
                Co = Cn;
            else
                fm0 = [fm0 1];
                Cl = [Cl Cn];
                Co = 0;
            end
            %Cn = 1;
        end
        if(Cn<=round(TH_st*(1+DerrRatio)) && Cn>=round(TH_st*(1-DerrRatio))) % it is short pulse
            if Co==0
                Co = Cn;
                Cn = 1;
                continue;
            else
                if(Co<=round(TH_st*(1+DerrRatio)) && Co>=round(TH_st*(1-DerrRatio)))
                    fm0 = [fm0 0];
                    Cs = [Cs Cn];
                    Co = 0;
                else
                    if (Co<=round(TH_lt*(1+DerrRatio)) && Co>=round(TH_lt*(1-DerrRatio)))
                        fm0 = [fm0 2];
                        Co = 0;
                    end
                end
            end
            %Cn = 1;
        end
        if(Cn<=round(3*TH_st*(1+DerrRatio)) && Cn>=round(3*TH_st*(1-DerrRatio)) && ...
            Co<=round(TH_st*(1+DerrRatio)) && Co>=round(TH_st*(1-DerrRatio)))
                fm0 = [fm0 0 2];
                Co=0;
                %Cn = 1;
        end
        Cn = 1;
    else % it is not edge
        if firsttime == 1
            continue;
        else
            Cn = Cn + 1;
        end
    end
end

