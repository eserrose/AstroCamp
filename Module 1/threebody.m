%------------------------------------------
% Three-Body Propogator
% 
% @param ~ - Time step (unused)
% @param S - Initial state vector [x y z vx vy vz]
% @param mu - Gravitational parameter
% 
% @return ds - State derivative vector [vx_earth vy_earth vz_earth
% vx_moon vy_moon vz_moon vx_sc vy_sc vz_sc ax_earth ay_earth az_earth
% ax_moon ay_moon az_moon ax_sc ay_sc az_sc]
%------------------------------------------
function ds = threebody(~, S, mu_earth, mu_moon)    
    
    rcm_earth      = S(1:3);   
    rcm_moon       = S(4:6);  
    rcm_spacecraft = S(7:9);  
    % defining position vectors for Earth, Moon, and space craft wrt center
    % of mass
    
    rearth_spacecraft = rcm_spacecraft - rcm_earth; % km
    rmoon_spacecraft = rcm_spacecraft - rcm_moon; % km
    rearth_moon = rcm_moon - rcm_earth; % km
    rmoon_earth = - rearth_moon; % km
    % defining position vectors for between each body (position of Earth wrt Moon, spacecraft wrt Earth, etc.)
    
    v_earth      = S(10:12); 
    v_moon       = S(13:15); 
    v_spacecraft = S(16:18); 
    % defining velocity vectors for Earth, Moon, and space craft wrt center of mass
    
    a_earth      = -(mu_moon/norm(rmoon_earth)^3)*rmoon_earth; 
    a_moon       = -(mu_earth/norm(rearth_moon)^3)*rearth_moon; 
    a_spacecraft = -(mu_earth/norm(rearth_spacecraft)^3)*rearth_spacecraft ...
                   -(mu_moon/norm(rmoon_spacecraft)^3)*rmoon_spacecraft;
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