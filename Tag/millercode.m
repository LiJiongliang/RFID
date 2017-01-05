function miller=millercode(din,M,dflag)
if dflag == 1
    din = [din(:) ;1];
end
p=numel(din);
state = [1 1;1 -1;-1 1;-1 -1];
s = zeros(1,p);
if din(1)==1
    s(1) = 2;
else
    s(1) = 1;
end

for I = 2:p
    switch s(I-1)
        case 1
            if din(I) == 0
                s(I) = 4;
            else
                s(I) = 2;
            end
        case 2
            if din(I) == 0
                s(I) = 4;
            else
                s(I) = 3;
            end
        case 3
            if din(I) == 0
                s(I) = 1;
            else
                s(I) = 2;
            end
        case 4
            if din(I) == 0
                s(I) = 1;
            else
                s(I) = 3;
            end
    end
end

mt = reshape(state(s,:)',1,2*p);
ms = ones(1,size(mt,2)*M);
ms(2:2:end) = -1;
miller = kron(mt,ones(1,M)).*ms;

