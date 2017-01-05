function Txmod_out = TxModem(s, fd, fc, fs,M,mode)

OSd = floor(fs/fd/2);
% switch M
%     case 0
%         OSd = fs/fd/2;
%     case 1
%         OSd = fs/fd/4;
%     case 2
%         OSd = fs/fd/8;
%     case 3
%         OSd = fs/fd/16;
% end

len = length(s)*OSd;
so = kron(s,ones(1,OSd));

if mode == 0 %ASK
    so(find(so==-1)) = 0;
    Txmod_out = so.*exp(-1j*2*pi*fc*(1:len)./fs);
else                %PSK
    Txmod_out = so.*exp(-1j*2*pi*fc*(1:len)./fs);
end
