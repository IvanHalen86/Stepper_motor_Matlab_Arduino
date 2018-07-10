% create an arduino object. the port should be the one you setted from the
% arduino software
ar = serial('/dev/cu.usbmodem1421','BaudRate',9600);
% open the port connected to arduino
fopen(ar);
% set the degrees you want the stepper to rotate.
degree = 90;

% start an If loop. In this case If the degrees are positive, the stepper
% rotate on one side, if they are negative, it rotates on the other side.

if degree > 0;
    
% create a matrix where the values goes from 3 to 10. In this case each
% value correspond to the activation and deactivation of a channel, for
% instance 3 and 4 correspond to the activation and deactivation of the
% channel 2. Watch this video to see how this works 
% https://www.youtube.com/watch?v=kr21ypVgb1M&t=198s

AS=(3:10);

% in order to rotate the stepper we have to repeat this matrix a certain
% number of times. the formula inside the code "round" refers to the
% number of times you have to repat the matrix. The factor 1.42 (512/360)
% is the factor that gives us the conversion form degree to steps of the
% stepper motor

repetitions=repmat(AS,1,round(abs(degree)*(512/360)))';

% start a for loop that activate and deactivate the channels in ordr to
% make the stepper motor rotate. 

    for j=1:length(repetitions);
        
        %activate the channels in sequence
        fprintf(ar,'%s',char(repetitions(j)));
        
        % put a pause of 100 ms in order to let arduino have the time to
        % upload the data and activate and deactivate the channel.
        pause(0.01);
    end
    
    
% in this case if the number of degrees are negative (i.e. you want to
% rotate the stepper on the other side), you have to activate and
% deactivate the cahnnels in a reverse waym starting from the channel 5 to
% the channel 2.
elseif degree < 0; 
AS=[9,10,7,8,5,6,3,4];
repetitions=repmat(AS,1,round(abs(degree)*(512/360)))';
    for j=1:length(repetitions);
    fprintf(ar,'%s',char(repetitions(j)));
    pause(0.01);
    end
end

% close the port once the stepper rotated 

fclose(ar);