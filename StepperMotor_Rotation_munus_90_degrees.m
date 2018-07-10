% create an arduino object. the port should be the one you set from the
% arduino software
ar = serial('/dev/cu.usbmodem1421','BaudRate',9600);
% open the port connected to arduino
fopen(ar);

% set the degrees you want the stepper to rotate.
degrees = -90;
% if you want to rotate the stepper on the other side, 
%you have to reverse the order of activation of the arduino channels. 
%You have first to activate and deactivate the channel number 5, 
% then 4, 3 and finally the number 2. 
% the AS matrix contains the number that activate and dectivate these
% channels in sequence

AS=[9,10,7,8,5,6,3,4];

% in order to rotate the stepper we have to repeat this matrix a certain
% number of times. the formula inside the code "round" refers to the
% number of times you have to repat the matrix. The factor 1.42 (512/360)
% is the factor that gives us the conversion form degree to steps of the
% stepper motor

repetitions=repmat(AS,1,round(abs(degrees)*(512/360)))';
    for j=1:length(repetitions);
        
        %activate the channels in sequence
        fprintf(ar,'%s',char(repetitions(j)));
        % pause of 100 ms
        pause(0.01);
    end
 % close the arduino port  
fclose(ar);