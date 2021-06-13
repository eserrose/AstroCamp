function plot_orbit(R, color)

    if nargin < 2
        color = 'k';
    end
    % checking for input color. If no user input color, function defaults
    % to black
    
    plot3(R(1, :), R(2,:), R(3,:), color) % km
    % 3D plot of problem 1 position vectors
    
end