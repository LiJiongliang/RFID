function Miller= millerdecode(peak_flag, DerrRatio, M)
global Sim

Ctable = [4 3 2;8 6 4;16 12 8]*Sim.ReaderOSR;

len = length(peak_flag);

Miller = [];
Cn = 1;
Cnts = 1;

First = 1;
for I =1:len
    if (peak_flag(I) == 1) % peak
        if First == 1
            Miller = [Miller 0];
            First = 0;
            Cn = 1;
            Si = 2;
            continue;
        else
            if(Cn<=round(Ctable(M,1)*(1+DerrRatio)) && Cn>=round(Ctable(M,1)*(1-DerrRatio)))
                Cn = Ctable(M,1);
                [D,So] = MSM(Cn,Si,M);
                Si = So;
                Miller = [Miller D];
            elseif(Cn<=round(Ctable(M,2)*(1+DerrRatio)) && Cn>=round(Ctable(M,2)*(1-DerrRatio)))
                  Cn = Ctable(M,2);
                  [D,So] = MSM(Cn,Si,M);
                  Si = So;
                  Miller = [Miller D];
            elseif(Cn<=round(Ctable(M,3)*(1+DerrRatio)) && Cn>=round(Ctable(M,3)*(1-DerrRatio)))
                  Cn = Ctable(M,3);
                  [D,So] = MSM(Cn,Si,M);
                  Si = So;
                  Miller = [Miller D];                    
            else
                continue;
%             else
%                 fprintf('there is error pulse width in the data sequence\n');
%                 keyboard;
            end
            Cn =1;
        end
    else
        if First == 1
            continue;
        else
            Cn = Cn + 1;
        end
    end
end

function [D,So] = MSM(C,Si,M)

global Sim

Ctable = [4 3 2;8 6 4;16 12 8]*Sim.ReaderOSR;
D = 10;
So = 10;
if ~(C==Ctable(M,1) || C==Ctable(M,2) || ...
        C==Ctable(M,3))
    fprintf('The counter input is invalid\n');
    keyboard
end
switch Si
    case 1%1 
        switch C
            case Ctable(M,1)
                D = [0 1];
                So= 3;
            case Ctable(M,2)
                D = [0];
                So= 2;
            case Ctable(M,3)
                D = [1];
                So = 1;
            otherwise
                So = Si;
%                 keyboard;
%                 fprintf('there is error in Count input\n');
        end
    case 2%0
         switch C
            case Ctable(M,2)
                D = [0 1];
                So= 3;
            case Ctable(M,3)
                D = [0];
                So = 2;
             otherwise
                 So = Si;
%                 keyboard;
%                 fprintf('there is error in Count input\n');
        end
    case 3%01
         switch C
            case Ctable(M,1)
                D = [0 1];
                So= 3;
            case Ctable(M,2)
                D = [0];
                So= 2;
            case Ctable(M,3)
                D = [1];
                So = 1;
             otherwise
                 So = Si;
%                 keyboard;
%                 fprintf('there is error in Count input\n');
        end
end