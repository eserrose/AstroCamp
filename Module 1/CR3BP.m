function ds = CR3BP(~, S, u)

    rspacecraft = []; % FILL IN VALUE
    vspacecraft = []; % FILL IN VALUE
    % defining position and velocity
    
    x = []; % FILL IN VALUE
    y = []; % FILL IN VALUE
    z = []; % FILL IN VALUE
    xdot = []; % FILL IN VALUE
    ydot = []; % FILL IN VALUE
    zdot = []; % FILL IN VALUE
    % defining x y z components of position and velocity
    
    r13 = []; % FILL IN VALUE
    % distance between space craft and Earth
    
    r23 = []; % FILL IN VALUE
    % distance between space craft and Moon
    
    xddot = []; % FILL IN VALUE
    yddot = []; % FILL IN VALUE
    zddot = []; % FILL IN VALUE
     % solving for acceleration using circular three body motion
    
    ds = zeros(6, 1);
    % preallocating empty array for state derivative
     
    ds(1:3) = vspacecraft; % non dim velocity
    ds(4:6) = [xddot; yddot; zddot]; % non dim acceleration
    % constructing state derivative matrix to be integrated by ode45
end