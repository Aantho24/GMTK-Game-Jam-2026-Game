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
	
	var order_requirements = level_data[$ level].order_requirements

	var all_toppings = variable_struct_get_names(order_requirements);
	for (var i = array_length(all_toppings)-1; i >= 0; --i) {
	    var topping = all_toppings[i];
	    var topping_amount_required = order_requirements[$ topping];
	
		ds_map_set(global.order_requirements,asset_get_index(topping),topping_amount_required)
	}
	
	var LEVEL_INTERMISSION_WAIT_PERIOD_SECONDS = 2
	begin_level_intermission = time_source_create(time_source_game, LEVEL_INTERMISSION_WAIT_PERIOD_SECONDS, time_source_units_seconds, function() {
		// Sets maximum toppings to the one set in the given level's level data
		var toppings_selection = level_data[$ level].toppings_selection
		var max_toppings = level_data[$ level].maximum_toppings
		create_random_toppings(max_toppings,toppings_selection)	
	})

	time_source_start(begin_level_intermission)
}