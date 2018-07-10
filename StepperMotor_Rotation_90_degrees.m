% create an arduino object. the port should be the one you setted from the
% arduino software
ar = serial('/dev/cu.usbmodem1421','BaudRate',9600);
% open the port connected to arduino
fopen(ar);

% set the number of degrees
degrees = 90;

% create a matrix where the values goes from 3 to 10. In this case each
% value correspond to the activation and deactivation of a channel, for
% instance 3 and 4 correspond to the activation and deactivation of the
% channel 2. Watch this video to see how this works 
% https://www.youtube.com/watch?v=kr21ypVgb1M&t=198s
AS=(3:10);

% If you want to rotate the stepper motor of 90 degrees 
% we need to multiply the degrees with a conversion factor. 
% Hence, since 512 repetitions corresponds to 360 degrees, 
% in order to define how many repetition corresponds correspond 
% to one degree we have to divide 512 with 360, 
% which gives us the factor 1,42. 
% This is the number which, multiplied by 90,
% gives us the numbers of repetition of the matrix.

repetitions=repmat(AS,1,round(abs(degrees)*(512/360)))';
    for j=1:length(repetitions);
        
        %activate the channels in sequence
        fprintf(ar,'%s',char(repetitions(j)));
        % pause of 100 ms
        pause(0.01);
    end
    
     fclose(ar);