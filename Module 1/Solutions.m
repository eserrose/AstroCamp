%------------------------------------------%
%-------------- Question 1 ----------------%
%------------------------------------------%

mu_earth = 398600;
S0 = [-7327.031; -813.869; 0; 1.137; -10.237; 0];
tspan = linspace(0, 40*24*3600, 10001); %40 days
options = odeset('RelTol', 1e-10);

[t,S] = ode45(@(t,S)twobody(t, S, mu_earth), tspan, S0, options);

S = S';
R = S(1:3, :);

f1 = figure;
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

[t,S] = ode45(@(t,S)threebody(t, S, mu_earth, mu_moon), tspan, S0, options);

S = S';
R_Earth = S(1:3,:);
V_Earth = S(10:12,:);
R = S(7:9, :) - R_Earth;
a = S(16:18,:)- V_Earth;

f2 = figure;
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

mu      = 1.2150585e-2;
l_star  = 3.850e5;       %km
t_star  = 3.758e5;       %s
v_star  = l_star/t_star; %km/s

R0 = [-(7327.031+4677.975); -813.869; 0];
V0 = ([1.137; -(10.237+0.013); 0] -  cross([0; 0; 1/t_star], R0)); %inertial to rotating
tspan_nodim = tspan/t_star;
S0_nodim = [R0/l_star; V0/v_star]

%------------------------------------------%
%-------------- Question 4 ----------------%
%------------------------------------------%

[t,S] = ode45(@(t,S)CR3BP(t, S, mu), tspan_nodim, S0_nodim, options);

S = S';
R = S(1:3, :);

f3 = figure;
hold on
plot_orbit(R, 'k')
plot_orbit([-4677.975; 0; 0]/l_star, '.')
plot_orbit([380322.025; 0; 0]/l_star, '.')
title('Orbit in Non-Dimensional System')
xlabel('l*')
ylabel('l*')
axis equal
legend('Satellite Orbit in Circular Three Body Problem','Earth','Moon')

S_final_CR3BP = round(S(:,end),5)

%------------------------------------------%
%-------------- Question 5 ----------------%
%------------------------------------------%

for i = 1:length(tspan_nodim)
    At = [cos(tspan_nodim(i)) -sin(tspan_nodim(i)) 0; 
      sin(tspan_nodim(i)) cos(tspan_nodim(i)) 0; 0 0 1]; %rotation matrix
    R(:,i) = l_star*At*S(1:3,i)- l_star*At*[-mu; 0; 0];
    V(:,i) = v_star*At*(S(4:6,i) + [-S(2,i);S(1,i);0]) - v_star*At*[0; -mu; 0];
end

f4 = figure;
hold on
plot_orbit(R, 'k')
plot_earth
title('Orbit in Dimensional System')
xlabel('km')
ylabel('km')
axis equal
legend('Satellite Orbit in Circular Three Body')

S_final_inertial = round([R(:,end);V(:,end)],3)