//print(ds_map_keys_to_array(global.stacked_toppings_tally))

toppings_tally = global.stacked_toppings_tally



for (var k = ds_map_find_first(order_requirements); !is_undefined(k); k = ds_map_find_next(order_requirements, k)) {
	var v = order_requirements[? k];
  
	print($"{k}: {v}")
}

print("")
/*
map = global.stacked_toppings_tally
for (var k = ds_map_find_first(map); !is_undefined(k); k = ds_map_find_next(map, k)) {
  var v = map[? k];
  print($"{k}: {v}")
}

print("\n")


get_index = 1

if array_length(global.stacked_toppings) > get_index
	print(object_get_name(global.stacked_toppings[get_index]))


// Get all of the instance name for 
// variable_instance_get_names

