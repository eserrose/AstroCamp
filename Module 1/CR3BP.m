function ds = CR3BP(~, S, u)

    rspacecraft = S(1:3); % FILL IN VALUE
    vspacecraft = S(4:6); % FILL IN VALUE
    % defining position and velocity
    
    x = S(1); % FILL IN VALUE
    y = S(2); % FILL IN VALUE
    z = S(3); % FILL IN VALUE
    xdot = S(4); % FILL IN VALUE
    ydot = S(5); % FILL IN VALUE
    zdot = S(6); % FILL IN VALUE
    % defining x y z components of position and velocity
    
    r13 = norm( [x; y; z] - [(-u); 0; 0] ); % FILL IN VALUE
    % distance between space craft and Earth
    
    r23 = norm( [x; y; z] - [(1-u); 0; 0] ); % FILL IN VALUE
    % distance between space craft and Moon
    
    xddot = 2*ydot+x-(1-u)/r13^3*(x+u)-u*(x-(1-u))/r23^3;
    yddot = y-2*xdot-(1-u)/r13^3*y-u/r23^3*y;
    zddot = -(1-u)/r13^3*z-u/r23^3*z;
    % solving for acceleration using circular three body motion
    
    ds = zeros(6, 1);
    % preallocating empty array for state derivative
     
    ds(1:3) = vspacecraft; % non dim velocity
    ds(4:6) = [xddot; yddot; zddot]; % non dim acceleration
    % constructing state derivative matrix to be integrated by ode45
end