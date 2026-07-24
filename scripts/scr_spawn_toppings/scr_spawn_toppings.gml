function create_toppings(amount, topping) {
	repeat (amount) {
		instance_create_layer(0,0,"Toppings",topping)
	}
}

function create_random_toppings(amount, array) {
	repeat (amount) {
		var random_index = irandom(array_length(array) - 1)
		instance_create_layer(0,0,"Toppings",array[random_index])
	}
}