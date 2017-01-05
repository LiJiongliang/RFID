function peak_flag = FindPeak_WD(din)

global Register

peak_flag = zeros(size(din));

Cnt = 0;
firsttime = 1;
zeroflag = 0;
peakold = 0;
for I = 1:length(din)
    if(din(I)~=0)
        if zeroflag == 0
            continue;
        else
            if firsttime == 1
                idx = I;
                firsttime = 0;
                Cnt = 1;
            else
                Cnt = Cnt + 1;
            end
        end
    else
        zeroflag = 1;
        if firsttime == 0
            if ([idx+floor(Cnt/2)-1:idx+floor(Cnt/2)+1]<=0)
                keyboard
            end
            if Register.TagCode == 0
                if Cnt >= 2
                    [peaknew,idxp] = max(din(idx+floor(Cnt/2)-1:idx+floor(Cnt/2)+1));
                    peakold = max(peakold,peaknew);
                    if peaknew > 1/3*peakold
                        peak_flag(idx+floor(Cnt/2)+idxp-2) = 1;
                        Cnt = 0;
                        firsttime = 1;
                    else
                        Cnt = Cnt + 1;
                        firsttime = 1;
                        continue;
                    end
                else
                    Cnt = Cnt + 1;
                    firsttime = 1;
                end
            else
                if Cnt >= 10
                    [peaknew,idxp] = max(din(idx+floor(Cnt/2)-1:idx+floor(Cnt/2)+1));
                    peakold = max(peakold,peaknew);
                    if peaknew > 1/2*peakold
                        peak_flag(idx+floor(Cnt/2)+idxp-2) = 1;
                        Cnt = 0;
                        firsttime = 1;
                    else 
                        Cnt = Cnt + 1;
                        firsttime = 1;
                        continue;
                    end
                else
                    Cnt = Cnt + 1;
                    firsttime = 1;
                end
            end
        else
            continue;
        end
    end
end

if din(end) ~=0
    [~,idx] = max(din(end-Cnt:end));
    peak_flag(end-Cnt+idx-1) = 1;
end
% if din(end) ~=0
%     idx = max(peak_flag(end-20:end));
%     peak_flag(end-20+idx) = 1;
% end
