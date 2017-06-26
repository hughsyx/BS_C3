phi = azimuth([lat(ind_src),lon(ind_src)],[lat(ind_rcv),lon(ind_rcv)]);
theta = azimuth([lat(ind_rcv),lon(ind_rcv)],[lat(ind_src),lon(ind_src)]);

Rotation(1,:) = [-cosd(phi)*cosd(theta),-sind(phi)*sind(theta),-cosd(phi)*sind(theta),-sind(phi)*cosd(theta)];
Rotation(2,:) = [-sind(phi)*sind(theta),-cosd(phi)*cosd(theta),sind(phi)*cosd(theta),cosd(phi)*sind(theta)];
Rotation(3,:) = [cosd(phi)*sind(theta),-sind(phi)*cosd(theta),-cosd(phi)*cosd(theta),sind(phi)*sind(theta)];
Rotation(4,:) = [sind(phi)*cosd(theta),-cosd(phi)*sind(theta),sind(phi)*sind(theta),-cosd(phi)*cosd(theta)];

Rotation(5,:) = [cosd(theta),sind(theta),0,0];
Rotation(6,:) = [-sind(theta),cosd(theta),0,0];
Rotation(7,:) = [0,0,-cosd(phi),-sind(phi)];
Rotation(8,:) = [0,0,sind(phi),-cos(phi)];