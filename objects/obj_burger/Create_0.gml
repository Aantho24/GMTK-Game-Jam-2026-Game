top_side_heat = 0
bottom_side_heat = 0

burger_rotation = 0
COOK_AMOUNT = 0.25
RESIDUAL_COOK_AMOUNT = 0.1

RAW_BURGER_COLOR = make_colour_rgb(229,113,113)
CHARRED_BURGER_COLOR = make_colour_rgb(35,11,11)


state_cooking_top = function() {
	x = mouse_x
	y = mouse_y
	
	if position_meeting(x,y,obj_grill) {
		top_side_heat = clamp(top_side_heat + COOK_AMOUNT, 0, 100)
		bottom_side_heat = clamp(bottom_side_heat + RESIDUAL_COOK_AMOUNT, 0, 100)
	}
	
	state_previous = state
	if mouse_check_button_pressed(mb_left) state = state_rotate
}

state_rotate = function() {
	x = mouse_x
	y = mouse_y
	
	if state_previous == state_cooking_bottom {
		burger_rotation = lerp(burger_rotation, 180, 0.25)
	} else if state_previous == state_cooking_top {
		burger_rotation = lerp(burger_rotation, 0, 0.25)
	}
	
	if burger_rotation < 2 {
		burger_rotation = 0
		state_previous = state
		state = state_cooking_bottom 
	} else if (180 - burger_rotation) < 2 {
		burger_rotation = 180
		state_previous = state
		state = state_cooking_top	
	}
}

state_cooking_bottom = function() {
	x = mouse_x
	y = mouse_y
	
	if position_meeting(x,y,obj_grill) {
		bottom_side_heat = clamp(bottom_side_heat + COOK_AMOUNT, 0, 100)
		top_side_heat = clamp(top_side_heat + RESIDUAL_COOK_AMOUNT, 0, 100)
	}
	
	state_previous = state
	if mouse_check_button_pressed(mb_left) state = state_rotate
}

state = state_cooking_bottom
state_previous = state