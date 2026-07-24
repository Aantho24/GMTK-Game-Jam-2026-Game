draw_set_font(font_tally)

for (var k = ds_map_find_first(map); !is_undefined(k); k = ds_map_find_next(map, k)) {
  var v = map[? k];
  
  draw_sprite(k,0,x_cursor,y_cursor)
  x_cursor += X_MARGIN
  
  draw_text(x_cursor,y_cursor - 11,$": {v}")
  y_cursor += Y_MARGIN
  x_cursor = X_CURSOR_START
}

y_cursor = Y_CURSOR_START
