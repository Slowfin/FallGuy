if onObject {
if mouse_check_button(mb_left) and jumpCharge < maxJumpCharge and canJump and jumpReload <= 0 {
	jumpCharge += 2
} 
if !mouse_check_button(mb_left) {
	if jumpCharge > 10 {
	spd = jumpCharge / 13
	jumpCharge = 0
	jumpReload = 60
	onObject = false
	cantRide = 10
	} else {
		jumpCharge = 0
	}
}
} else {
	objCamera.setY = lerp(objCamera.setY,y,0.1)
	if mouse_check_button_pressed(mb_left) and !dive and jumpReload <= 0 {
	spd = 2.5
	mouseDir =  point_direction(x,y,mouse_x,mouse_y)
	dive = true
	alarm[0] = 50
} 	
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
	other.ownObject = id
	other.onObject = true
	other.spd = 0
	other.y -= spd
	other.jumpReload = 0
	}
	if other.ownObject == id and other.onObject {
	objCamera.setY = lerp(objCamera.setY,y,0.1)
	other.spd = 0
	other.y -= spd
	other.jumpReload = 0
	other.onObject = true
	}
} }

x += lengthdir_x(spd,mouseDir)
y += lengthdir_y(spd,mouseDir)

if spd > 0 {
spd = lerp(spd, 0 , 0.07)	
}

angle = mouseDir 

if !objLand.fall {
y += global.fallSpd
}
