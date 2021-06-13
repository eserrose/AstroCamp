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
S_final_two = round(S(:,end),5)

%------------------------------------------%
%-------------- Question 2 ----------------%
%------------------------------------------%
mu_moon = 4902.8;
S0 = [-4677.975; 0; 0; 380322.025; 0; 0; -(7327.031+4677.975); -813.869; 0; 
      0; -0.013; 0; 0; 1.012; 0; 1.137; -(10.237+0.013); 0];

[t,S] = ode45(@(t,S)threebody(t, S, mu, mu_moon), tspan, S0, options);

S = S';
R = S(7:9, :) - S(1:3,:);
a = S(16:18,:)- S(10:12,:);

hold on
plot_orbit(R, 'k')
plot_earth
title('Three-body Orbit')
xlabel('km')
ylabel('km')
zlabel('km')
axis equal
legend('Three-body Motion')

S_final_three = round([R(:,end);a(:,end)],5)

%------------------------------------------%
%-------------- Question 3 ----------------%
%------------------------------------------%

mu_star = 1.2150585e-2;
l_star  = 3.850e5;       %km
t_star  = 3.758e5;       %s
v_star  = l_star/t_star; %km/s

R0 = [-(7327.031+4677.975); -813.869; 0];
V0 = ([1.137; -(10.237+0.013); 0] -  cross([0; 0; 1/t_star], R0)); %inertial to rotating
S0_nodim = [R0/l_star; V0/v_star];
tspan_nodim = tspan/t_star;