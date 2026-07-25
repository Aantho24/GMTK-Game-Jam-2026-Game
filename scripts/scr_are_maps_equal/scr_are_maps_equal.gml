function are_maps_equal(map1, map2) {
	if ds_map_size(map1) != ds_map_size(map2) {
	    return false;
	}

	for (var k = ds_map_find_first(map1); !is_undefined(k); k = ds_map_find_next(map1, k)) {
	    if !ds_map_exists(map2, k) {
	        return false;
	    }
   
	    if map1[?k] != map2[?k] {
	        return false;
	    }
	}

	return true;
}

function goto_level(level) {
	with (obj_topping) {
		instance_destroy()	
	}
	
	with (obj_telegraph) {
		instance_destroy()	
	}
	
	global.stacked_toppings = []
	ds_map_clear(global.order_requirements)
	ds_map_clear(global.stacked_toppings_tally)
	
	obj_burger.heat = 0

	// Sets order requirement to the one set in the given level's level data
	
	var toppings_selection = level_data[$ level].toppings_selection
	var order_requirements = level_data[$ level].order_requirements
	var max_toppings = level_data[$ level].maximum_toppings

	var all_toppings = variable_struct_get_names(order_requirements);
	for (var i = array_length(all_toppings)-1; i >= 0; --i) {
	    var topping = all_toppings[i];
	    var topping_amount_required = order_requirements[$ topping];
	
		ds_map_set(global.order_requirements,asset_get_index(topping),topping_amount_required)
	}

	// Sets maximum toppings to the one set in the given level's level data
	create_random_toppings(max_toppings,toppings_selection)	
}

// level_data[$ level].order_requirements