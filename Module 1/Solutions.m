%------------------------------------------%
%-------------- Question 1 ----------------%
%------------------------------------------%

mu = 398600;
S0 = [-7327.031; -813.869; 0; 1.137; -10.237; 0];
tspan = linspace(0, 40*24*3600, 10001); %40 days
options = odeset('RelTol', 1e-10);

[t,S] = ode45(@(t,S)twobody(t, S, mu), tspan, S0, options);

S = S';
R = S(1:3, :);

hold on
plot_orbit(R, 'k')
plot_earth
title('Two-body Orbit')
xlabel('km')
ylabel('km')
zlabel('km')
axis equal
legend('Two-body Motion')

format longG
S_final = round(S(:,end),5)