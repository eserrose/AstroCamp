function ds = twobody(~, S, mu)    
    
    r = []; % FILL IN VALUE
    v = []; % FILL IN VALUE
    % defining position and velocity
    
    a = []; % FILL IN VALUE
    % solving for acceleration using two body motion
    
    ds = zeros(6,1); % [km/s; km/s^2]
    % preallocating empty array for state derivative
    
    ds(1:3) = v; % km/s
    ds(4:6) = a; % km/s^2
    % constructing state derivative matrix to be integrated by ode45
end