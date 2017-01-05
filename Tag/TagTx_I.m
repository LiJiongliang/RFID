function Tx_s = TagTx_I(Txdin)

global Register
global Sim

% CRC16 or CRC5
CRCout = CRC_Encoder(Txdin, Register.TagCRCType);

% fm0 or miller encoding
dflag = 1;
if Register.TagCode == 0
    Cout = fm0code(CRCout,dflag); % 0 1 seq BLF*2
    Preamble = fm0preamble_gen(Register.TagTRext); %0 1 seq BLF*2
else
    M = 2^Register.TagCode;
    Cout = millercode(CRCout,M,dflag); % 0 1 seq BLF*2
    Preamble = millerpreamble_gen(Register.TagTRext,M); % 0 1 seq BLF*2
end
Dout = [Preamble Cout];

% ASK or BPSK modulator
Tx_s = TxModem(Dout, Sim.Tag.BLF, Sim.TagFc, Sim.TagFs,Register.TagCode,Register.TagMod);

