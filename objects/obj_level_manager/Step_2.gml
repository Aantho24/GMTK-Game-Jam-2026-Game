if are_maps_equal(global.stacked_toppings_tally, global.order_requirements) and obj_burger.heat == 100 {
	var max_level = struct_names_count(level_data)
	level++
	level = min(level, max_level)
	goto_level(level)
}

for (var k = ds_map_find_first(global.stacked_toppings_tally); !is_undefined(k); k = ds_map_find_next(global.stacked_toppings_tally, k)) {
	var v = global.stacked_toppings_tally[? k];
	
	if !ds_map_exists(global.order_requirements, k) 
	or (ds_map_exists(global.order_requirements, k) and (global.order_requirements[? k] - v < 0)) {
		goto_level(level)
	}
}

/*
for (var k = ds_map_find_first(global.order_requirements); !is_undefined(k); k = ds_map_find_next(global.order_requirements, k)) {
	var v = global.order_requirements[? k];
  
	print($"{k}: {v}")
}

print("")
