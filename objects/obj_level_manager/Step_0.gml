if are_maps_equal(global.stacked_toppings_tally, order_requirements) print("win")


/*
for (var k = ds_map_find_first(order_requirements); !is_undefined(k); k = ds_map_find_next(order_requirements, k)) {
	var v = order_requirements[? k];
  
	print($"{k}: {v}")
}

print("")
