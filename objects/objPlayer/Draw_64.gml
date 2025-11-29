draw_set_font(fntComicSans)
draw_set_halign(fa_center)
if jumpCharge < 30 {
	shakePower = 0
	draw_set_color(c_white)	
} else if jumpCharge >= 30 and jumpCharge <= 50  {
	shakePower = 1
	draw_set_color(c_yellow)	
} else if jumpCharge >= 60 and jumpCharge <= 90  {
	shakePower = 2
	draw_set_color(c_orange)	
}  else if jumpCharge > 90  {
	shakePower = 8
	draw_set_color(c_red)	
}

shakeX = irandom_range(-shakePower,shakePower)
shakeY = irandom_range(-shakePower,shakePower)
draw_set_font(fntPixel)
draw_text_transformed(70+shakeX,10+shakeY,ceil(jumpCharge/10),5,5,0)
draw_set_color(c_white)	
draw_set_halign(fa_left)
draw_set_font(fntComicSans)
draw_text_transformed(30,100,string(ceil(-y))+"m",4,4,0)

	