if are_maps_equal(global.stacked_toppings_tally, global.order_requirements) and obj_burger.heat == 100 {
	with (obj_topping) {
		instance_destroy()	
	}
	
	with (obj_telegraph) {
		instance_destroy()	
	}
	

	var max_level = struct_names_count(level_data)
	level = min(level++,max_level)
	goto_level(level)
}



/*
for (var k = ds_map_find_first(global.order_requirements); !is_undefined(k); k = ds_map_find_next(global.order_requirements, k)) {
	var v = global.order_requirements[? k];
  
	print($"{k}: {v}")
}

print("")
