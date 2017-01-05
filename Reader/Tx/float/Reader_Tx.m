function Tx_s = Reader_Tx(Txdin)

global Sim
global Register

%% CRC16
CRCout = CRC_Encoder(Txdin,Register.ReaderCRCType);

%% PIE encoding
PIEout = tpp(CRCout);
Preamble = tpp_pre_gen();
Td = [Preamble PIEout];

%% Mod index
Td(find(Td== 1)) = 1900;
Td(find(Td == 0)) = round(2047*Register.ModIdx);
OSd = 9;
Td = kron(Td,ones(1, OSd));

%% Pulse shaping filter
PSFout = psf(Td,OSd);

%% Hilbert transform for SSB-AM
if Register.ReaderMod ==1
    Modout = hilbertfilter(PSFout);
else
    Modout = complex(PSFout,zeros(1,length(PSFout)));
end

%% Upsampling 4 times by Halfband filter
if Register.ReadTxDataEnable == 1
    Tx_s = UpsamplingF(Modout);
else
    Tx_s = 2047+ 1j*0;
end
