function create_toppings(topping, amount) {
	repeat (amount) {
		instance_create_layer(0,0,"Toppings",topping)
	}
}

create_toppings(obj_onion, 3)
create_toppings(obj_pickle, 3)
create_toppings(obj_tomato, 3)