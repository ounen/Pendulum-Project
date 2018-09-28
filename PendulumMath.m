function xdot = PendulumMath(t,x,M,m,f,g,l);
% User Input
thetaDes = 0; % Invertable

kp = 425;
% User Input

persistent lastError
if isempty(lastError)
    lastError = 0;
end
error = thetaDes - x(3)

F = -kp*error

lastError = error

pos = x(2);
posdot = ( -m*g*sin(x(3)) + m*l*x(4)^2*sin(x(3)) + f*m*x(4)*cos(x(3)) + F )/( M + (1-cos(x(3))^2)*m );

theta = x(4);
thetadot = ( (M+m)*(g*sin(x(3)) - f*x(4)) - (l*m*x(4)^2*sin(x(3)) + F)*cos(x(3)) )/( l*(M + (1-cos(x(3))^2)*m));

xdot = [pos; posdot; theta; thetadot]