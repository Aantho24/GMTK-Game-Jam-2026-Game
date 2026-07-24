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
