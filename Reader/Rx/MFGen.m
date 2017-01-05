function MF = MFGen()

global Sim
global Register

d0 = 0;
d1 = 1;
dflag = 0;
M = 2^Register.TagCode;
OSd = floor(Sim.TagFs/Sim.Tag.BLF/Sim.ReaderDownOSR/2);% M

if Register.TagCode == 0
%     Ref0 = kron(fm0code(d0,dflag),ones(1,OSd)); % m sequence
%     Ref1 = kron(fm0code(d1,dflag),ones(1,OSd));
    Ref0 = gm_gen(OSd*2);
    Ref1 = Ref0;
else
%     if Register.TagCode~=3
        Ref0 = kron(millercode(d0,M,dflag),ones(1,OSd));
        Ref1 = kron(millercode(d1,M,dflag),ones(1,OSd));
%     else
%         
%     end
end

MF = [Ref0;Ref1];




