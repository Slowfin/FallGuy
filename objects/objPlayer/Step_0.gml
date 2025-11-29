if onObject {
if mouse_check_button(mb_left) and jumpCharge < maxJumpCharge and canJump and jumpReload <= 0 {
	jumpCharge += 2
	vsp = 0
} 
if !mouse_check_button(mb_left) {
	if jumpCharge > 10 {
	if vsp > 0 {
	spd = (jumpCharge / 11) * vsp
	} else {
	spd = (jumpCharge / 11) 	
	}
	partTime = 15
	jumpCharge = 0
	jumpReload = 60
	angle = mouseDir 
	onObject = false
	cantRide = 10
	image_index = 0
	swim = true
	} else {
		jumpCharge = 0
	}
}
} else {
	objCamera.setY = lerp(objCamera.setY,y,0.3)
	if mouse_check_button(mb_left) and !dive and jumpReload <= 0 {
	if vsp > 0 {
	spd = 1.5 * vsp
	} else {
	spd = 1.5
	}
	mouseDir =  point_direction(x,y,mouse_x,mouse_y)
	dive = true
	angle = mouseDir 
	alarm[0] = 50
	image_index = 0
	swim = true
} 	
}

if partTime > 0 {
	partTime -= 1
	jumpPart = part_system_create(parJump)
	part_particles_burst(jumpPart,x,y,parJump)
}

if cantRide > 0 {
	cantRide -= 1	
} if !place_meeting(x,y,objObject) {
	cantRide = 0	
}

if jumpCharge > 0 {
	mouseDir =  point_direction(x,y,mouse_x,mouse_y)
}	

if jumpReload > 0 {
	jumpReload -= 1
}	

if jumpReload <= 0 and !onObject {
	ownObject = 0
}

if cantRide == 0 {
with objObject if place_meeting(x,y,objPlayer) or (other.ownObject == id and other.onObject) {
	 if other.ownObject != id and !other.onObject {
		 if object_index == objObject {
			var landPart = part_system_create(parGround)
			part_particles_burst(landPart,x,y,parGround) }
		if object_index == objRocket {
			var pickupPart = part_system_create(parPickup)
			part_particles_burst(pickupPart,x,y,parPickup)}
	partTime = 0
	other.ownObject = id
	other.onObject = true
	other.spd = 0
	other.y -= spd
	vsp = 0
	other.jumpReload = 0
	}
	if other.ownObject == id and other.onObject {
	
		if object_index == objObject {
	objCamera.setY = lerp(objCamera.setY,y,0.3)
	other.spd = 0
	other.y -= (spd - global.fallSpd)
	other.jumpReload = 0
	other.onObject = true }
		if object_index == objRocket {

	objCamera.setY = lerp(objCamera.setY,y,0.3)
	other.x = x
	other.y = y
	other.jumpReload = 2
	other.onObject = true }
	}
} }

x += lengthdir_x(spd,mouseDir)
y += lengthdir_y(spd,mouseDir)

if spd > 0 {
spd = lerp(spd, 0 , 0.07)
} if spd > 1 {
vsp = 2
}


if !onObject {
y += vsp
}

if vsp < 3 and !onObject {
vsp += grv
}

if vsp > 2 and !onObject {
	if ((angle) > 180 and ceil(angle) <= 270) or ((angle) > 0 and ceil(angle) <= 90) {
		angle -= 1
	}
	else if ((angle) > 90 and ceil(angle) <= 180) or ((angle) > 270 and ceil(angle) <= 360)  {
		angle += 1
	} 	
	if ceil(angle) == 0 {
		angle = 360
	}
}
if vsp >= 3  {
	var fallPart = part_system_create(parFall)
	part_particles_burst(fallPart,x,y,parFall)
}
	
if mouse_check_button_pressed(mb_left) {
	if mouse_x > x  {
	image_yscale = -1	
} if mouse_x < x  {
	image_yscale = 1	
} }
	if swim {
		sprite_index = sprPlayerSwim
	}
	else if vsp >= 3 {
		sprite_index = sprPlayerFall
	} else {
		sprite_index = sprPlayer	
	} 
	
	if swim = true and image_index >= image_number -1 {
		swim = false
	}