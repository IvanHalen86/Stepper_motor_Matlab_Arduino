# Stepper_motor_Matlab_Arduino
In order to use these codes you have first to download the Matlab Arduino communication in my previous repository. 

This is the video that explains the first steps you have to do in order to make Matlab to communicate with Arduino. 
In the link below the video you will find the link for the codes

https://www.youtube.com/watch?v=kr21ypVgb1M&t=198s

Once you download that, you can watch this video on youtube which explains how to use an Arduino stepper motor with matlab

https://youtu.be/b8_gBcoVW5Y

The codes are in this repository. 

"StepperMotor_Rotation_1.m" file is the first example i use in the video
"StepperMotor_Rotation_90_degrees.m" file is the second example. In this case we make rotate the stepper motor of 90 degrees
"StepperMotor_Rotation_munus_90_degrees.m" file makes the stepper motor rotate of -90 degrees

The positive and negaitve sides are completely arbitrary. You can choose your own way to define the positive and negative sides of rotations.

"StepperMotor_Rotation_Complete_Code.m" is the complete code with the IF statement for merging the previous codes together. If it's 90, it will rotate the stepper motor on one side, if it's -90 in the other side. 
