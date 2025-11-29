camX = camera_get_view_x(view_camera[0])


fallTimer -= 1
if fallTimer <= 0 {
	fallTimer = fallSpd
	wind = part_system_create(parWind)
	part_particles_burst(wind,camX,objCamera.setY-90,parWind)
}	

y = objPlayer.y