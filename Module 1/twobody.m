%------------------------------------------
% Two-Body Propogator
% 
% @param ~ - Time step (unused)
% @param S - Initial state vector [x y z vx vy vz]
% @param mu - Gravitational parameter
function ds = twobody(~, S, mu)    
    
    r = S(1:3); % FILL IN VALUE
    v = S(4:6); % FILL IN VALUE
    % defining position and velocity
    
    a = -mu/norm(r)^3*r; % FILL IN VALUE
    % solving for acceleration using two body motion
    
    ds = zeros(6,1); % [km/s; km/s^2]
    % preallocating empty array for state derivative
    
    ds(1:3) = v; % km/s
    ds(4:6) = a; % km/s^2
    % constructing state derivative matrix to be integrated by ode45
end