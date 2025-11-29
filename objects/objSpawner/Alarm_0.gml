var chance = irandom(11)
if chance < 11 {
instance_create_layer(random_range(10,350),objPlayer.y-irandom_range(160,240),"Objects",objObject)
instance_create_layer(random_range(10,350),objPlayer.y+irandom_range(160,240),"Objects",objObject)
}
if chance == 11 {
instance_create_layer(random_range(10,350),objPlayer.y-irandom_range(160,240),"Objects",objRocket)
instance_create_layer(random_range(10,350),objPlayer.y+irandom_range(160,240),"Objects",objRocket)
}

alarm[0] = irandom_range(20,60)