function count_sum_of_collected_toppings() {
	var all_tally_values = ds_map_values_to_array(global.stacked_toppings_tally)
	
	var sum_of_tallies = 0
	
	for (var topping_tally = 0; topping_tally < array_length(all_tally_values); topping_tally++) {
		sum_of_tallies += all_tally_values[topping_tally]
	}
	
	return sum_of_tallies
}

function count_sum_of_required_toppings() {
	var all_tally_values = ds_map_values_to_array(global.order_requirements)
	
	var sum_of_tallies = 0
	
	for (var topping_tally = 0; topping_tally < array_length(all_tally_values); topping_tally++) {
		sum_of_tallies += all_tally_values[topping_tally]
	}
	
	return sum_of_tallies
}