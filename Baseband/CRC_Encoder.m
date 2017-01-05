function Dout = CRC_Encoder(Din, type)
% spec page 84
% r seq [data r1->MSB r16/r5->LSB]
% The generator polynomial is G(x)=x^16+x^12+x^5+1; default vaule FFFF
% The generator polynomial is G(x)=x^5+x^3+1; default vaule 01001
payload = Din(:);

if type == 0
    r = ones(16,1);
    for I=1:length(payload)
        s1=bitxor(payload(I),r(1));    
        s2=bitxor(s1,r(12));        
        s3=bitxor(s1,r(5));         
        r=[r(2:16); s1];             
        r(11)=s2;                   
        r(4)=s3;                  
    end
else
    r = zeros(5,1);
    r(1) = 1;
    r(3) = 1;
    for I=1:length(payload)
        s1=bitxor(payload(I),r(1));    
        s2=bitxor(s1,r(3));        
         r=[r(2:5); s1];             
        r(2)=s2;            
    end    
end

Dout = [payload; r];
