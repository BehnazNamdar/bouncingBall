# bouncingBall
A function get radius and speed as input and draw a bouncing ball using Psychtoolbox. 


Write a function called bouncingBall(), the function should take two inputs:

- An integer called speed

- An integer called radius

The function should:

- Draw a circle in the center of the screen with radius equal to radius. Wait for the user to press a key. The circle will then start moving diagonally towards the lower right hand corner of the screen. The speed at which it moves will be determined by speed: speed is actually the number of pixels that the circle will move each frame. In other words, increment both the x and y position of the circle by speed every frame.

- If the circle should "bounce" off the edge of the screen. That means that once it hits the bottom of the screen, it will start to move up instead of down, and when it hits the right side of the screen it will start to move left instead of right, etc.

- The color of the circle should randomly change whenever it hits a wall - The circle will continue to bounce around the screen indefinitely
