function y = tpp(x)
% x = randi(2,1,10)-1;
% need to determine LSB first or MSB first
% 00-> 2Ts width [1 0]
% 01-> 3Ts width [1 1 0]
% 11-> 4Ts width [1 1 1 0]
% 10-> 5Ts width [1 1 1 1 0]
x = x(:);
if mod(length(x),2)==1
    x = [x;0];
end

d = [2,1]*reshape(x,2,length(x)/2)+1;
y=[];
for I = 1:size(d,2)
    switch d(I)
        case 1
            y = [y 1 0];
        case 2
            y =[y 1 1 0];
        case 3
            y = [y 1 1 1 1 0];
        case 4
            y = [y 1 1 1 0];
    end
end



