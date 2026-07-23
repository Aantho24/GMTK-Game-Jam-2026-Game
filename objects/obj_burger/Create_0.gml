heat = 0

COOK_AMOUNT = 0.25
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

	if position_meeting(x,y,obj_grill)
		state = state_cooking
	else if mouse_check_button_pressed(mb_left)
		state = state_inactive
}

state_cooking = function() {
	x = mouse_x
	y = mouse_y
	
	if position_meeting(x,y,obj_grill) {
		heat = clamp(heat + COOK_AMOUNT, 0, 100)
	} else {
		state = state_follow_cursor	
	}
	
	if mouse_check_button_pressed(mb_left) and position_meeting(mouse_x, mouse_y, self) {
		state = state_cooking_idle
	}
}

state_cooking_idle = function () {
	if position_meeting(x,y,obj_grill) {
		heat = clamp(heat + COOK_AMOUNT, 0, 100)
	}
	
	if mouse_check_button_pressed(mb_left) and position_meeting(mouse_x, mouse_y, self) {
		state = state_follow_cursor
	}
}

state = state_inactive