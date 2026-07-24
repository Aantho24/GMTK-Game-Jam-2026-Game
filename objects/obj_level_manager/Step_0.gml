if are_maps_equal(global.stacked_toppings_tally, global.order_requirements) print("win")



/*
for (var k = ds_map_find_first(global.order_requirements); !is_undefined(k); k = ds_map_find_next(global.order_requirements, k)) {
	var v = global.order_requirements[? k];
  
	print($"{k}: {v}")
}

print("")
