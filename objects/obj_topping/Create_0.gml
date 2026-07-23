SPEED = 2
DIRECTION = choose(-1,1)

room_x_min = -(sprite_width / 2)
room_x_max = room_width + (sprite_width / 2)

room_y_min = sprite_height / 2
room_y_max = room_height - (sprite_height / 2)

set_x()
set_y()

state_move = function() {
	x += DIRECTION * SPEED

	if DIRECTION == 1 and x >= room_x_max {
		x = room_x_min
		set_y()
	} else if DIRECTION == -1 and x <= room_x_min {
		x = room_x_max
		set_y()
	}
	
	if (place_meeting(x,y,obj_burger) or place_meeting(x,y,global.stacked_toppings)) and instance_exists(obj_burger) {
		stack_height = (obj_burger.sprite_height / 2)
	
		for (var topping = 0; topping < array_length(global.stacked_toppings); topping += 1) {
			stack_height += global.stacked_toppings[topping].sprite_height
		}
		
		array_push(global.stacked_toppings, self)
		
		// Sprite and x-y must be updated immediately after calculating stack height
		// Waiting until next step causes stacked_toppings to be out of order, causing stack_height 
		// to be miscalculated and toppings to spawn at wrong y
		var on_burger_sprite_index = asset_get_index("spr" + string_delete(object_get_name(object_index),1,3) + "_on_burger")
		if on_burger_sprite_index == -1 {
			sprite_index = on_burger_sprite
		} else {
			sprite_index = on_burger_sprite_index	
		}
	
		x = obj_burger.x
		y = obj_burger.y - stack_height
		
		state = state_stacked
	}
}

state_stacked = function() {
	x = obj_burger.x
	y = obj_burger.y - stack_height
}

state = state_move