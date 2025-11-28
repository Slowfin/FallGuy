draw_set_font(fntPixel)
draw_set_halign(fa_center)
if jumpCharge < 30 {
	shakePower = 0
	draw_set_color(c_white)	
} else if jumpCharge >= 30 and jumpCharge <= 50  {
	shakePower = 0.5
	draw_set_color(c_yellow)	
} else if jumpCharge >= 60 and jumpCharge <= 90  {
	shakePower = 1
	draw_set_color(c_orange)	
}  else if jumpCharge > 90  {
	shakePower = 3
	draw_set_color(c_red)	
}

shakeX = irandom_range(-shakePower,shakePower)
shakeY = irandom_range(-shakePower,shakePower)
draw_text_transformed(50+shakeX,10+shakeY,ceil(jumpCharge/10),3,3,0)
draw_text_transformed(100+shakeX,50+shakeY,ceil(-y),3,3,0)
