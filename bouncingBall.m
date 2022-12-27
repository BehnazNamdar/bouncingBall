function  bouncingBall(radius,speed)
% The function should take two inputs:
%   An integer called speed
%   An integer called radius
%
%
% %Draw a circle in the center of the screen with radius equal to radius.
% Wait for the user to press a key.
% The circle will then start moving diagonally towards the lower right hand corner of the screen.
% The speed at which it moves will be determined by speed.
% speed is actually the number of pixels that the circle will move each frame.
% In other words, increment both the x and y position of the circle by speed every frame.
% - If the circle should "bounce" off the edge of the screen.
%   That means that once it hits the bottom of the screen,
%   it will start to move up instead of down,
%   and when it hits the right side of the screen it will start to move left instead of right, etc.
% - The color of the circle should randomly change whenever it hits a wall
% - The circle will continue to bounce around the screen indefinitely

%-----------------------------
% setting parameters of window
%-----------------------------
Screen('Preference', 'SkipSyncTests', 1);
windowColor = [128 128 128];
windowSize = [0 0 500 400];

% set color of the first circle
circleColor = [255 0 0];

% get number of screen
scrNum = Screen('Screens');

% open a window
[wptr , rect ] = Screen('OpenWindow' , scrNum, windowColor , windowSize);


%-----------------------------
% setting parameters for centering
%-----------------------------
screenWidth = rect(3);           % This is width of screen
screenHeight = rect(4);          % This is hieght of screen
screenCenterX = screenWidth/2;   % This is center of the width of the screen
screenCenterY = screenHeight/2;  % This is center of the hieght of the screen


circleRectLeft = screenCenterX - radius;     % first rect of circle
circleRectTop = screenCenterY - radius;     % second rect of circle
circleRectRight = screenCenterX + radius;    % third rect of circle
circleRectBottom = screenCenterY + radius;  % forth rect of circle
circleRect = [circleRectLeft, circleRectTop, circleRectRight, circleRectBottom]; % rect of circle



%----------------------------------------------------------------------
% draw a circle in the center of the screen with radius equal to radius
%----------------------------------------------------------------------
Screen('FillOval' , wptr , circleColor , circleRect );
Screen('Flip' , wptr );


% % Wait for the user to press a key 
KbWait(); 

%---------------------------------------------------------------------
% moving the circle towards the lower right hand corner of the screen
% with the given speed
%---------------------------------------------------------------------
 
xv = speed; 
yv = speed;

if radius > speed
    
    while circleRect(2) > rect(2)-radius && circleRect(4) < rect(4)+radius && circleRect(1) > rect(1)-radius ...
            && circleRect(3) < rect(3)+ radius
        
        
        circleRect = circleRect + [ xv,  yv , xv , yv ];
        
        
        if circleRect(4) >= rect(4) || circleRect(2) <= rect(2)
            
            circleColor = randperm(255, 3);
            yv = -1 * yv;
        end
        
        if circleRect(3) >= rect(3) || circleRect(1) <= rect(1)
            
            circleColor = randperm(255, 3);
            xv = -1 * xv;
        end
        
        Screen('FillOval' , wptr , circleColor , circleRect );
        Screen('Flip' , wptr );
        end
    
else
    
    while circleRect(2) > rect(2)-speed && circleRect(4) < rect(4)+speed && circleRect(1) > rect(1)-speed ...
            && circleRect(3) < rect(3)+ speed
        
        circleRect = circleRect + [ xv,  yv , xv , yv ];
        
        if circleRect(4) >= rect(4) || circleRect(2) <= rect(2)
            
            circleColor = randperm(255, 3);
            yv = -1 * yv;
        end
        
        if circleRect(3) >= rect(3) || circleRect(1) <= rect(1)
            
            circleColor = randperm(255, 3);
            xv = -1 * xv;
        end
        
        Screen('FillOval' , wptr , circleColor , circleRect );
        Screen('Flip' , wptr );
        
        
    end
    
end

end

