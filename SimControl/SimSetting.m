function SimSetting()
global Sim

Sim.Reader.DClkidx = 1;
Sim.Reader.DClkTable = [1/(6.25e-6) 1/(12.5e-6)]; %160e3 80e3 
Sim.Reader.DClk = Sim.Reader.DClkTable(Sim.Reader.DClkidx );    
if Sim.Reader.DClkidx == 1
    Sim.Reader.DAClk = 5.76e6;
else
    Sim.Reader.DAClk = 5.76e6/2;
end
Sim.Reader.ADClk = 23.04e6;
Sim.DerrRatio = 0.2;

% % Sim.Tag.BLFidx = 7;
Sim.Tag.BLFTable = [1/5 3/7 6/11 1 2/5 6/7 12/11 2];
Sim.ReaderDownOSRTable = [18 8 6 4 9 4 3 2];
Sim.ReaderOSRTable = [20 21 22 18 20 21 22 18];
Sim.ReaderOSR = Sim.ReaderOSRTable(Sim.Tag.BLFidx);
Sim.Tag.BLF = 320e3*Sim.Tag.BLFTable(Sim.Tag.BLFidx);
Sim.ReaderDownOSR = Sim.ReaderDownOSRTable(Sim.Tag.BLFidx);
Sim.len = 32;

% Sim.Tag.DClkTable = [1/5 3/7 6/11 1 2/5 6/7 12/11 2];
Sim.TagFc = 0e3; % fs/fc is interger
Sim.TagFs = 23.04e6; % fs/BLF is interger

