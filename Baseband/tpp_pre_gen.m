function tpp_preamble = tpp_pre_gen()

global Sim

if(Sim.Reader.DClkidx == 1)  % 80khz
    tpp_preamble = [0 ones(1,7) 0 1 0];
else %160khz
    tpp_preamble = [0 0 ones(1,7) 0 1 0];
end
