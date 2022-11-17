% editing...

close all;
clc

tspan = [0 0.2];
figure()
hold on
for x0 = -0.5:0.05:0.5
    for xdot0 = -1.0:0.08:1.0
        xinitial = [x0;xdot0];
        [tout,stateout] = ode45(@ForwardDynamics, tspan, xinitial);
        %%Phase Plane
        xout = stateout(:,1);
        xdotout = stateout(:,2);
        plot(xout,xdotout);
        drawnow
    end
end
title(['\fontname{times new roman}' 'incline angle: 0.1 rad'], 'fontsize', 14);
xlabel(['\fontname{times new roman}' 'angle (rad)'], 'fontsize', 14);
ylabel(['\fontname{times new roman}' 'angular velocity (rad/s)'], 'fontsize', 14);
xlim([-0.14 0.14])
ylim([-0.6 0.6])

function dstatedt = ForwardDynamics(t, state)

x= state(1);
xdot = state(2);

Fl = 0.2301; 
I = 0.001741;

% xddot = Fl/I*x ; forward dynamics

xddot = Fl/I*sin(x + 0.1) ;

dstatedt = [xdot;xddot]; % X dot
end