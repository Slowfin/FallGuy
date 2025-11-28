if objPlayer.y > -10 {
	fall = true
}

if fall {
 y = lerp(y,-30,0.1)
 objPlayer.spd = 0
}