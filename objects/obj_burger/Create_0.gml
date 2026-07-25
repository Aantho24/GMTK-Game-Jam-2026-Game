heat = 0

// 0.1, 0.18, 0.25
COOK_AMOUNT = 0.3
RAW_BURGER_COLOR = make_colour_rgb(229,113,113)
COOKED_BURGER_COLOR = make_colour_rgb(108,50,40)
// make_colour_rgb(82,39,27)

x_padding = sprite_width / 4
y_padding = sprite_height / 10

state_inactive = function() {
	if mouse_check_button_pressed(mb_left) and position_meeting(mouse_x, mouse_y, self) {
		state = state_follow_cursor
	}
}

state_follow_cursor = function() {
	x = mouse_x
	y = mouse_y

	if position_meeting(x,y,obj_grill) and instance_exists(obj_grill) and time_source_get_state(obj_level_manager.begin_level_intermission) == time_source_state_stopped {
		state = state_cooking
	} /* else if mouse_check_button_pressed(mb_left) {
		state = state_inactive
	} */
}

state_cooking = function() {
	x = mouse_x
	y = mouse_y
	
	if position_meeting(x,y,obj_grill) {
		heat = clamp(heat + COOK_AMOUNT, 0, 100)
	} else {
		state = state_follow_cursor	
	}
	
	/*
	if mouse_check_button_pressed(mb_left) and position_meeting(mouse_x, mouse_y, self) {
		state = state_cooking_idle
	}
	*/
}

state_cooking_idle = function () {
	if position_meeting(x,y,obj_grill) {
		heat = clamp(heat + COOK_AMOUNT, 0, 100)
	}
	
	/*
	if mouse_check_button_pressed(mb_left) and position_meeting(mouse_x, mouse_y, self) {
		state = state_follow_cursor
	}
	*/
}

state = state_follow_cursor