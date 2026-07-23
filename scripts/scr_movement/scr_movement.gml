function set_x() {
	if DIRECTION == 1 {
		x = room_x_min - irandom(room_width)
	} else {
		x = room_x_max + irandom(room_width)
	}
}

function set_y() {
	y = irandom_range(room_y_min, room_y_max)
}