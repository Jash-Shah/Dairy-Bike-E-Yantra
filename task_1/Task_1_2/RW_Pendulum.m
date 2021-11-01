1;
pkg load control;
pkg load image;



##**************************************************************************
##*                OCTAVE PROGRAMMING (e-Yantra)
##*                ====================================
##*  This software is intended to teach Octave Programming and Mathematical
##*  Modeling concepts
##*  Theme: Dairy Bike
##*  Filename: RW_Pendulum.m
##*  Version: 2.0.0  
##*  Date: October 27, 2021
##*
##*  Team ID :
##*  Team Leader Name:
##*  Team Member Name
##*
##*  
##*  Author: e-Yantra Project, Department of Computer Science
##*  and Engineering, Indian Institute of Technology Bombay.
##*  
##*  Software released under Creative Commons CC BY-NC-SA
##*
##*  For legal information refer to:
##*        http://creativecommons.org/licenses/by-nc-sa/4.0/legalcode 
##*     
##*
##*  This software is made available on an �AS IS WHERE IS BASIS�. 
##*  Licensee/end user indemnifies and will keep e-Yantra indemnified from
##*  any and all claim(s) that emanate from the use of the Software or 
##*  breach of the terms of this agreement.
##*  
##*  e-Yantra - An MHRD project under National Mission on Education using 
##*  ICT(NMEICT)
##*
##**************************************************************************

## Function : draw_RW_pendulum()
## ----------------------------------------------------
## Input:   y - State Vector. In case of inverted RW pendulum, the state variables
##              are angular position of RW alpha, angular velocity of RW alpha_dot, angle of pendulum
##              bar theta wrt vertical and angular velocity theta_dot of pendulum
##              bar.
##
## Purpose: Takes the state vector as input. It draws the inverted RW pendulum in 
##          a 2D plot.
function draw_RW_pendulum(y,m1, m2, l1, wr)
  theta = y(1); # angle of Pendulum Bar
  alpha = y(3); # angle of Reaction wheel
  x=0;
  y=0;
  px = l1*sin(theta);
  py = -l1*cos(theta);
  w1x = px-wr/2;
  w1y = py-wr/2;
  hold on;
  clf;
  line ([-10 10], [0 0], "linestyle", "-", "color", "k");
  line ([x px], [y py], "linestyle", "-", "color", "k");
  rectangle('Position',[x-0.1,y-0.05,.2,.1],'Curvature',0,'FaceColor',[1 0.1 0.1])
  radius = wr/2;
  center = [px py];
  rotation = alpha;
  rotTForm = [cos(rotation) sin(rotation); -sin(rotation) cos(rotation)];
  #viscircles(center,radius,'Color','b');
  
  hold on
  centerLines = center + [0 radius; 0 0; radius 0];
  rotatedLines = (centerLines - center)*rotTForm + center;
  plot(px, py, '.g', 'MarkerSize',200)
  plot(rotatedLines(:,1), rotatedLines(:,2),'-.');
  hold on
  xlim([-6 6]);
  ylim([-5 5]);
  set(gcf, 'Position', [100 100 1200 800]);
  drawnow
  hold off
endfunction

## Function : RW_pendulum_dynamics()
## ----------------------------------------------------
## Input:   y - State Vector. In case of inverted RW pendulum, the state variables
##              are angular position of RW alpha, angular velocity of RW alpha_dot, angle of pendulum
##              bar theta wrt vertical and angular velocity theta_dot of pendulum
##              bar.
##          m1 - Mass of pendulum bar
##          m2 - Mass of reaction wheel
##          l1 - Length of pendulum bar
##          g  - Acceleration due to gravity
##          u  - Input to the system. Input is the torque acting on the RW.
##
## Output:  dy -  Derivative of State Vector.
##
## Purpose: Calculates the value of the vector dy according to the equations which 
##          govern this system.
function dy = RW_pendulum_dynamics(y, m1, m2, l1, wr, g, u)
  ##u=2*u
  I1=;
  I2=;
  dy(1,1) = ;
  dy(2,1) = ;
  dy(3,1) = ;
  dy(4,1) = ;
endfunction

## Function : sim_RW_pendulum()
## ----------------------------------------------------
## Input:   m1 - Mass of pendulum bar
##          m2 - Mass of reaction wheel
##          l1 - Length of pendulum bar
##          g  - Acceleration due to gravity
##          y0 - Initial Condition of system
##
## Output:  t - Timestep
##          y - Solution array
##          
## Purpose: This function demonstrates the behavior of RW pendulum system without 
##          any external input (u).
##          This integrates the system of differential equation from t0 = 0 to 
##          tf = 10 with initial condition y0
function [t,y] = sim_RW_pendulum(m1, m2, l1, wr, g, y0)
  tspan = 0:0.1:10;                  ## Initialise time step           
  u = 0;                             ## No Input
  [t,y] = ; ## Solving the differential equation    
endfunction

## Function : RW_pendulum_AB_matrix()
## ----------------------------------------------------
## Input:   m1 - Mass of pendulum bar
##          m2 - Mass of reaction wheel
##          l1 - Length of pendulum bar
##          g  - Acceleration due to gravity
##
## Output:  A - A matrix of system
##          B - B matrix of system
##          
## Purpose: Declare the A and B matrices in this function.
function [A, B] = RW_pendulum_AB_matrix(m1 , m2, l1, wr, g)
  I1= ;  # Moment of Inertia of pendulum bar
  I2= ; # Moment of Inertia of reaction wheel
  A = ;
  B = ;  
endfunction

## Function : pole_place_RW_pendulum()
## ----------------------------------------------------
## Input:   m1 - Mass of pendulum bar
##          m2 - Mass of reaction wheel
##          l1 - Length of pendulum bar
##          g  - Acceleration due to gravity
##          y_setpoint - Reference Point
##          y0 - Initial Condition
##
## Output:  t - Timestep
##          y - Solution array
##          
## Purpose: This function demonstrates the behavior of inverted RW pendulum with 
##          external input using the pole_placement controller
##          This integrates the system of differential equation from t0 = 0 to 
##          tf = 10 with initial condition y0 and input u = -Kx where K is
##          calculated using Pole Placement Technique.
function [t,y] = pole_place_RW_pendulum(m1, m2, l1, wr, g, y_setpoint, y0)
  
  tspan = 0:0.1:10;
  [t,y] = ;
endfunction

## Function : lqr_RW_pendulum()
## ----------------------------------------------------
## Input:   m1 - Mass of pendulum bar
##          m2 - Mass of reaction wheel
##          l1 - Length of pendulum bar
##          g  - Acceleration due to gravity
##          y_setpoint - Reference Point
##          y0 - Initial Condition
##
## Output:  t - Timestep
##          y - Solution array
##          
## Purpose: This function demonstrates the behavior of inverted RW pendulum with 
##          external input using the LQR controller
##          This integrates the system of differential equation from t0 = 0 to 
##          tf = 10 with initial condition y0 and input u = -Kx where K is
##          calculated using LQR Controller.
function [t,y] = lqr_RW_pendulum(m1, m2, l1, wr, g, y_setpoint, y0)
  
  tspan = 0:0.1:10; # Time Array 
  [t,y] = ;  # ODE solver to solve differential equations
endfunction

## Function : RW_pendulum_main()
## ----------------------------------------------------
## Purpose: Used for testing out the various controllers by calling their 
##          respective functions and observing the behavior of the system. Constant
##          parameters like mass of Reaction Wheel, mass of pendulum bar etc are declared here.
function RW_pendulum_main()
  m1 = 8;     # Mass of Pendulum Bar
  m2= 0.08;   # Mass of Reaction Wheel 
  l1= 3;      # Length of Pendulum Bar
  g = 9.8;    # Centre of Gravity
  y0 = [0.9*pi; 0; 0; 0]; # Initial Conditions
  y_setpoint = [pi; 0; 2*pi; 0];  # Reference Point
  wr=1; #wheel radius

## Function Calls for different control techniques for stabilizing RW Pendulum
  
  [t,y] = sim_RW_pendulum(m1, m2, l1, wr, g, y0);
##  [t,y] = pole_place_RW_pendulum(m1, m2, l1, wr, g, y_setpoint, y0);
##  [t,y] = lqr_RW_pendulum(m1, m2, l1, wr, g, y_setpoint, y0);
  
  for k = 1:length(t)
    draw_RW_pendulum(y(k, :), m1, m2, l1, wr);  # Function to draw current state of RW Pendulum
  endfor
endfunction
