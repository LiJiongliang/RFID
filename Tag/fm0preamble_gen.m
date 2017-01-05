function fm0_preamble = fm0preamble_gen(TRext)
% TRext = 0-> short fm0 preamble
% TRext = 1-> long fm0 preamle
% reference spec. page16
% TRext = 0;
dflag = 0;
if TRext == 0
    fm0_part1 = fm0code([1 1 1 0],dflag);
    fm0_part2 = fm0code([0 0],dflag);
    fm0_preamble = [fm0_part1 1 -1 ...
                                  fm0_part2  -1 -1];
else
    fm0_part1 = fm0code([zeros(1,12) 1 1 1 0],dflag);
    fm0_part2 = fm0code([0 0],dflag);
    fm0_preamble = [fm0_part1 1 -1 ...
                                  fm0_part2 -1 -1];
end
