function plot_earth

    [earth_x, earth_y, earth_z] = sphere(60); % km

    Planet = surf(6378*earth_x, 6378*earth_y, -6378*earth_z,...
                  'FaceColor', 'TextureMap','CData',imread('Earth.bmp'),...
                  'EdgeColor','None');
    % 3D plot of sphere representing Earth

end