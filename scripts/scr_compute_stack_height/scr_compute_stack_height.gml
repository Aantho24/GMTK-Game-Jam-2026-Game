function compute_stack_height(){
	var stack_height = (obj_burger.sprite_height / 2)
	
	for (var topping = 0; topping < array_length(global.stacked_toppings); topping++) {
		stack_height += global.stacked_toppings[topping].sprite_height
	}
	
	return stack_height
}