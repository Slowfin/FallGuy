
y -= spd
if id != objPlayer.ownObject {
angle += spd
}

if y > objPlayer.y + 300 {
	instance_destroy()	
}

y += global.fallSpd