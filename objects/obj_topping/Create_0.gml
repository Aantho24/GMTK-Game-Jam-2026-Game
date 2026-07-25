SPEED = obj_level_manager.level_data[$ obj_level_manager.level].topping_speed
DIRECTION = choose(-1,1)
ROTATION_SPEED = 6

room_x_min = -(sprite_width / 2)
room_x_max = room_width + (sprite_width / 2)

room_y_min = sprite_height / 2
room_y_max = room_height - (sprite_height / 2)

image_angle = random(360)

function set_x() {
	var OFFSET_MIN = 50
	var OFFSET_MAX = 370
	
	if DIRECTION == 1 {
		x = room_x_min - irandom_range(OFFSET_MIN,OFFSET_MAX)
	} else {
		x = room_x_max + irandom_range(OFFSET_MIN,OFFSET_MAX)
	}
}

function set_y() {
	y = irandom_range(room_y_min, room_y_max)
}

set_x()
set_y()

if DIRECTION == 1 {
	object_telegraph = instance_create_layer(2,y,"Telegraphs",obj_telegraph)
} else {
	object_telegraph = instance_create_layer(room_width-2,y,"Telegraphs",obj_telegraph, {
		image_xscale : -1	
	})	
}

state_move = function() {
	x += DIRECTION * SPEED
	
	image_angle += ROTATION_SPEED
	
	var toppings_selection = obj_level_manager.level_data[$ obj_level_manager.level].toppings_selection

	if x > room_x_min and x < room_x_max and instance_exists(object_telegraph) {
		instance_destroy(object_telegraph)
	} else if (DIRECTION == 1 and x >= room_x_max) or (DIRECTION == -1 and x <= room_x_min) {
		create_random_toppings(1,toppings_selection)
		instance_destroy()
	} 
	
	if (place_meeting(x,y,obj_burger) or place_meeting(x,y,global.stacked_toppings)) and instance_exists(obj_burger) {
		if instance_exists(object_telegraph) instance_destroy(object_telegraph)
		
		// Computes stack height
		stack_height = (obj_burger.sprite_height / 2)
	
		for (var topping = 0; topping < array_length(global.stacked_toppings); topping++) {
			stack_height += global.stacked_toppings[topping].sprite_height
		}
		
		array_push(global.stacked_toppings, self)

		// Tallies topping
		var topping_name = sprite_index
		if !ds_map_exists(global.stacked_toppings_tally, topping_name) {
			ds_map_add(global.stacked_toppings_tally, topping_name, 1)
		} else {
			ds_map_set(global.stacked_toppings_tally, topping_name, ds_map_find_value(global.stacked_toppings_tally, topping_name) + 1)
		}

		// Changes sprite_index to on_burger variant
		// Sprite and x-y must be updated immediately after calculating stack height
		// Waiting until next step causes stacked_toppings to be out of order, causing stack_height 
		// to be miscalculated and toppings to spawn at wrong y
		var on_burger_sprite_index = asset_get_index("spr" + string_delete(object_get_name(object_index),1,3) + "_on_burger")
		if on_burger_sprite_index != -1 {
			sprite_index = on_burger_sprite_index
		}
	
		// Puts topping on burger
		x = obj_burger.x
		y = obj_burger.y - stack_height

		create_random_toppings(1, toppings_selection)
		
		image_angle = 0
		
		state = state_stacked
	}
}

state_stacked = function() {
	x = obj_burger.x
	y = obj_burger.y - stack_height
}

state = state_move