function xdot = PendulumMath(t,x,M,m,f,g,l);
% User Input
thetaDes = 0;   % invertable pendulum position
kp = 425;
ki = 0;
kd = 25;

% Get Required Error Values for PID
error = thetaDes - x(3)
errorDot = -x(4)
intError = x(5)

% PID Implementation
F = -( kp*error + ki*intError + kd*errorDot )

% Dynamics of System
pos = x(2);
posdot = ( -m*g*sin(x(3)) + m*l*x(4)^2*sin(x(3)) + f*m*x(4)*cos(x(3)) + F )/( M + (1-cos(x(3))^2)*m );
theta = x(4);
thetadot = ( (M+m)*(g*sin(x(3)) - f*x(4)) - (l*m*x(4)^2*sin(x(3)) + F)*cos(x(3)) )/( l*(M + (1-cos(x(3))^2)*m));

% Return State Rates
xdot = [pos; posdot; theta; thetadot; error]