function [D_payload,FrameSync] = frameSync(din)

global Register

if Register.TagCode ==0
    sync = [2 0 0 2];
else 
    sync = [0 0 1 1 1 1 0 1];
end

len = length(sync);
for I = 1:length(din)-len
    if din(I:len+I-1) == sync
        fprintf('frame sync find in the %d position\t', I);
        FrameSync = 1;
        D_payload = din(len+I:end);
        fprintf('frame sync find\t');
        return;
    else
        FrameSync = 0;
        D_payload = din;
    end
    if(I==(length(din)-len))
        fprintf('cannot find frame sync\t');
        keyboard;
    end
end






