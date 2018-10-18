clc; clear all


%% DYNAMICS
%x xdot theta thetadot IntegralOfError
x0 = [2; 0; pi/8; 0; 0];
tf = 6;
M = 5;          % Cart Mass
m = 4;          % Ball Mass
f = 0.01;          % Rotational Friction
g = 10;         % Gravity
l = 1.5;        % Pendulum Length

[t x] = ode15s(@(t,x) PendulumMath(t,x,M,m,f,g,l), [0:0.01:tf], x0);

%% ANIMATION
fig1 = figure('Color','white')
grid on
axis equal 
% xlim([-2 2])
ylim([-(l+0.5) (l+0.5)])

for i = 1:length(t)
    time = text(x(i,1) - 0.2, l+0.25,['Time: ', num2str(i/100)]);
    angle = text(x(i,1) - 0.2, l+0.5,['Angle: ', num2str(x(i,3)*180/pi)]);

    % Define Points
    cart = [x(i,1) 0];
    ball = l*[cos(x(i,3) - pi/2)   -sin(x(i,3) - pi/2)] + cart;
    
    % Draw Points
    cartpoint = viscircles(cart, 0.01)
    pendulumdraw = line([cart(1) ball(1)], [cart(2) ball(2)])
    ballpoint = viscircles(ball, 0.05)
    
    pause(0.01);
    
    if i<length(t)
        delete(cartpoint);
        delete(pendulumdraw);
        delete(ballpoint);
        delete(time);
        delete(angle);
    end 
    
end