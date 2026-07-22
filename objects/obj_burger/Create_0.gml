top_side_heat = 0
bottom_side_heat = 0

state_cooking_top = function() {
	x = mouse_x
	y = mouse_y
	
	top_side_heat += 1
	
	if mouse_check_button_pressed(mb_left) state = state_cooking_bottom
}

state_cooking_bottom = function() {
	x = mouse_x
	y = mouse_y
	
	bottom_side_heat += 1
	
	if mouse_check_button_pressed(mb_left) state = state_cooking_top
}

state = state_cooking_bottom