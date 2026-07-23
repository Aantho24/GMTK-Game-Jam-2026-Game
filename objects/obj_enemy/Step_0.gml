x += DIRECTION * SPEED

if DIRECTION == 1 and x >= room_x_max {
	x = room_x_min
	set_y()
} else if DIRECTION == -1 and x <= room_x_min {
	x = room_x_max
	set_y()
}