function miller_preamble = millerpreamble_gen(TRext,M)
% TRext = 0-> 4*M miller preamble
% TRext = 1-> 16*M miller preamle
% reference spec. page19
% TRext = 0;
dflag = 0;
P = [0 0 1 1 1 1 0 1];
if TRext == 0
    ms = ones(1,4*2*M);
else
    ms = ones(1,16*2*M);
end
ms(2:2:end) = -1;
%     m = ones(1,size(ms,2)*M);
%     m(2:2:end) = -1;
%     ms = kron(ms,ones(1,M)).*m;
miller = millercode(P,M,dflag);
miller_preamble = [ms miller];
    


