top_side_heat = 0
bottom_side_heat = 0

burger_rotation = 0
COOK_AMOUNT = 0.25

// Should this be removed? Because it encourages you to constantly flip burger
RESIDUAL_COOK_AMOUNT = 0.1

RAW_BURGER_COLOR = make_colour_rgb(229,113,113)
CHARRED_BURGER_COLOR = make_colour_rgb(35,11,11)

state_inactive = function() {
	if mouse_check_button_pressed(mb_left) and position_meeting(mouse_x, mouse_y, self) {
		state = state_follow_cursor
	}
}

state_follow_cursor = function() {
	x = mouse_x
	y = mouse_y

	if room = room_grill and position_meeting(x,y,obj_grill) and state_previous == state_cooking_top
		state = state_cooking_top
	else if room = room_grill and position_meeting(x,y,obj_grill)
		state = state_cooking_bottom
	else if mouse_check_button_pressed(mb_left)
		state = state_inactive
}

state_cooking_top = function() {
	x = mouse_x
	y = mouse_y
	
	if position_meeting(x,y,obj_grill) {
		top_side_heat = clamp(top_side_heat + COOK_AMOUNT, 0, 100)
		bottom_side_heat = clamp(bottom_side_heat + RESIDUAL_COOK_AMOUNT, 0, 100)
	} else {
		state_previous = state
		state = state_follow_cursor	
	}
	
	if mouse_check_button_pressed(mb_left) {
		state_previous = state
		state = state_rotate
	}
}

state_cooking_bottom = function() {
	x = mouse_x
	y = mouse_y
	
	if position_meeting(x,y,obj_grill) {
		bottom_side_heat = clamp(bottom_side_heat + COOK_AMOUNT, 0, 100)
		top_side_heat = clamp(top_side_heat + RESIDUAL_COOK_AMOUNT, 0, 100)
	} else {
		state_previous = state
		state = state_follow_cursor	
	}
	
	if mouse_check_button_pressed(mb_left) {
		state_previous = state
		state = state_rotate
	}
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
		state = state_cooking_bottom 
	} else if (180 - burger_rotation) < 2 {
		burger_rotation = 180
		state = state_cooking_top	
	}
}

state = state_inactive
state_previous = state