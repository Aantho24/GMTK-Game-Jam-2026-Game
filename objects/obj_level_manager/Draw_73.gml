draw_set_font(font_tally)

for (var k = ds_map_find_first(global.order_requirements); !is_undefined(k); k = ds_map_find_next(global.order_requirements, k)) {
	var v = global.order_requirements[? k];
	
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_alpha(1)
	
	draw_sprite(k,0,x_cursor,y_cursor)
	x_cursor += X_MARGIN
	
	if !ds_map_exists(global.stacked_toppings_tally, k) {
		draw_text(x_cursor,y_cursor - 11,$"{v}")
	} else {
		// print target - current
		draw_text(x_cursor,y_cursor - 11,$"{v - global.stacked_toppings_tally[? k]}")
	}
	
	x_cursor += X_PADDING
  
	if x_cursor > MAX_WIDTH {
		y_cursor += Y_PADDING
		x_cursor = X_CURSOR_START
	}
}

y_cursor = Y_CURSOR_START
x_cursor = X_CURSOR_START

/*
if key doesn't exist, write 0
if key exists, write target - current


/*
draw_set_font(font_tally)

var toppings_tally = global.stacked_toppings_tally
for (var k = ds_map_find_first(toppings_tally); !is_undefined(k); k = ds_map_find_next(toppings_tally, k)) {
  var v = toppings_tally[? k];
  
  draw_sprite(k,0,x_cursor,y_cursor)
  x_cursor += X_MARGIN
  
  draw_text(x_cursor,y_cursor - 11,$": {v}")
  x_cursor += X_PADDING
  
  if x_cursor > MAX_WIDTH {
	y_cursor += Y_PADDING
	x_cursor = X_CURSOR_START
  }
}

y_cursor = Y_CURSOR_START
x_cursor = X_CURSOR_START

