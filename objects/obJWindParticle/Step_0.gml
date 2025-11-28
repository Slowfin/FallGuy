camX = camera_get_view_x(view_camera[0])


fallTimer -= 1
if fallTimer <= 0 {
	fallTimer = fallSpd
	wind = part_system_create(parWind)
	part_emitter_region(wind,0,camX - 350,camX - 10,objCamera.setY,objCamera.setY-90,0,0)
}	

y = objPlayer.y