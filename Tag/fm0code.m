function fm0=fm0code(din,dflag)
% dflag = 0: preamble
% dflag = 1: data
if dflag == 1
    din = [din(:) ;1];
end
p=numel(din);
state = [1 1;1 -1;-1 1;-1 -1];
s = zeros(1,p);
if din(1)==1
    s(1) = 1;
else
    s(1) = 2;
end

for I = 2:p
    switch s(I-1)
        case 1
            if din(I) == 0
                s(I) = 3;
            else
                s(I) = 4;
            end
        case 2
            if din(I) == 0
                s(I) = 2;
            else
                s(I) = 1;
            end
        case 3
            if din(I) == 0
                s(I) = 3;
            else
                s(I) = 4;
            end
        case 4
            if din(I) == 0
                s(I) = 2;
            else
                s(I) = 1;
            end
    end
end
fm0 = reshape(state(s,:)',1,2*p);
