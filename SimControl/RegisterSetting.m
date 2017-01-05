function RegisterSetting()

global Register

%% Tag related
%BLF data encoder config register bits
% Register.TagCode = 0;                                   %0->fm0; 1->miller2; 2->miller4; 3->miller8

% CRC16 or CRC5
Register.TagCRCType = 0;                            %0->CRC16, 1->CRC5

% modulation type
Register.TagMod = 0;                                     % 0->ASK  1->BPSK

% preamble 
Register.TagTRext = 0;                                   % 0->short preamble  1->long preamble
%% Reader related
% modulation type
Register.ReaderMod = 0;                               % 0->DSB-ASK  1->SSB-ASK
Register.ReaderCRCType = 0;                      % only used CRC16
Register.ModIdx = 0.3;                                    % modulation idex 30%~100%
Register.ReadTxDataEnable = 1;
