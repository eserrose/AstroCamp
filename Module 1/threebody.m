function ds = threebody(~, S, mu_earth, mu_moon)    
    
    rcm_earth = []; % FILL IN VALUE    
    rcm_moon = []; % FILL IN VALUE   
    rcm_spacecraft = []; % FILL IN VALUE   
    % defining position vectors for Earth, Moon, and space craft wrt center
    % of mass
    
    rearth_spacecraft = rcm_spacecraft - rcm_earth; % km
    rmoon_spacecraft = rcm_spacecraft - rcm_moon; % km
    rearth_moon = rcm_moon - rcm_earth; % km
    rmoon_earth = - rearth_moon; % km
    % defining position vectors for between each body (position of Earth wrt Moon, spacecraft wrt Earth, etc.)
    
    v_earth = []; % FILL IN VALUE   
    v_moon = []; % FILL IN VALUE 
    v_spacecraft = []; % FILL IN VALUE 
    % defining velocity vectors for Earth, Moon, and space craft wrt center of mass
    
    a_earth = []; % FILL IN VALUE 
    a_moon =  []; % FILL IN VALUE 
    a_spacecraft = []; % FILL IN VALUE 
    % solving for acceleration vectors for Earth, Moon, and spacecraft using three body motion
    
    ds = zeros(18,1); % [km/s; km/s^2]
    % preallocating empty array for state derivative
    
    ds(1:3) = v_earth; % km/s 
    ds(4:6) = v_moon; % km/s
    ds(7:9) = v_spacecraft; % km/s
    ds(10:12) = a_earth; % km/s^2
    ds(13:15) = a_moon; % km/s^2
    ds(16:18) = a_spacecraft;  % km/s^2
    % constructing state derivative matrix to be integrated by ode45
end