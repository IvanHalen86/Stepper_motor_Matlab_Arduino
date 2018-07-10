% create an arduino object. the port should be the one you set from the
% arduino software
ar = serial('/dev/cu.usbmodem1421','BaudRate',9600);
% open the port connected to arduino
fopen(ar);

% create a matrix where the values goes from 3 to 10. In this case each
% value correspond to the activation and deactivation of a channel, for
% instance 3 and 4 correspond to the activation and deactivation of the
% channel 2. Watch this video to see how this works 
% https://www.youtube.com/watch?v=kr21ypVgb1M&t=198s

AS=(3:10);


% In my stepper motor a complete revolution, which means a rotation of 360 degree, 
% is obtained through 4096 step. 
% Since 8 step are obtained through a matrix of 8 values, 
%we need to repeat this matrix for 4096/8 = 512 times 
%to obtain a rotation of 360 degrees. 
% so in a matrix we repeat the first matrix for 512 times. 

repetitions=repmat(AS,1,512)';
    for j=1:length(repetitions);
        
        %activate the channels in sequence
        fprintf(ar,'%s',char(repetitions(j)));
        % pause of 100 ms
        pause(0.01);
    end
    % close arduino port
    fclose(ar);