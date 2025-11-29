
if id != objPlayer.ownObject {
y -= spd
y += global.fallSpd
angle += spd
}

if y > objPlayer.y + 300 {
	instance_destroy()	
}



if id == objPlayer.ownObject and objPlayer.onObject {
	mouseDir =  point_direction(x,y,mouse_x,mouse_y)
	spd =4
	x += lengthdir_x(spd,mouseDir)
	y += lengthdir_y(spd,mouseDir)
	angle = mouseDir
	objPlayer.angle = angle
	objPlayer.spd = 0
	objPlayer.vsp = 0
	flyTime -=  1
	part_particles_burst(0,x,y+14,parFire)

	
}

if flyTime <= 0  {
	instance_destroy()	
	objPlayer.onObject = 0
	var yDiff = mouse_y - objPlayer.y
	objPlayer.vsp = sign(yDiff) * 1
	if mouse_x > x  {
	image_yscale = -1	
} if mouse_x < x  {
	image_yscale = 1	
}
}

if place_meeting(x,y,objRocket) and id == objPlayer.ownObject and objPlayer.onObject {
	flyTime = 150
} if place_meeting(x,y,objRocket) and id != objPlayer.ownObject and objPlayer.onObject {
	instance_destroy()
	
}
