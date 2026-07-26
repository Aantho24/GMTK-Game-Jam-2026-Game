draw_set_font(font_tally)

for (var order_requirement_topping = ds_map_find_first(global.order_requirements); !is_undefined(order_requirement_topping); order_requirement_topping = ds_map_find_next(global.order_requirements, order_requirement_topping)) {
	var order_requirement_amount = global.order_requirements[? order_requirement_topping];
	
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_alpha(1)
	
	if !ds_map_exists(global.stacked_toppings_tally, order_requirement_topping) {
		draw_sprite(order_requirement_topping,0,x_cursor,y_cursor)
		x_cursor += X_MARGIN
		draw_text(x_cursor,y_cursor - 11,$"{order_requirement_amount}")
		
		x_cursor += X_PADDING
  
		if x_cursor > MAX_WIDTH {
			y_cursor += Y_PADDING
			x_cursor = X_CURSOR_START
		}
	} else if global.stacked_toppings_tally[? order_requirement_topping] != order_requirement_amount {
		draw_sprite(order_requirement_topping,0,x_cursor,y_cursor)
		x_cursor += X_MARGIN
		draw_text(x_cursor,y_cursor - 11,$"{order_requirement_amount - global.stacked_toppings_tally[? order_requirement_topping]}")
	
		x_cursor += X_PADDING
  
		if x_cursor > MAX_WIDTH {
			y_cursor += Y_PADDING
			x_cursor = X_CURSOR_START
		}
	}
}

y_cursor = Y_CURSOR_START
x_cursor = X_CURSOR_START

