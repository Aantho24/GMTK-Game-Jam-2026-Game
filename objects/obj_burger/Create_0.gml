top_side_heat = 0
bottom_side_heat = 0

burger_rotation = 0
COOK_AMOUNT = 0.2

RAW_BURGER_COLOR = make_colour_rgb(229,120,114)
CHARRED_BURGER_COLOR = make_colour_rgb(25,25,25)


state_cooking_top = function() {
	x = mouse_x
	y = mouse_y
	
	top_side_heat = clamp(top_side_heat + COOK_AMOUNT, 0, 100)
	
	if mouse_check_button_pressed(mb_left) state = state_cooking_bottom
}

state_cooking_bottom = function() {
	x = mouse_x
	y = mouse_y
	
	bottom_side_heat = clamp(bottom_side_heat + COOK_AMOUNT, 0, 100)
	
	if mouse_check_button_pressed(mb_left) state = state_cooking_top
}

state = state_cooking_bottom