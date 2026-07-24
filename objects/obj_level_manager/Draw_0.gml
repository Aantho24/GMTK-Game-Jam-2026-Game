draw_set_font(font_tally)

for (var k = ds_map_find_first(map); !is_undefined(k); k = ds_map_find_next(map, k)) {
  var v = map[? k];
  draw_text(x_cursor,y_cursor,$"{k}: {v}")
  y_cursor += TEXT_Y_SHIFT
}

y_cursor = Y_CURSOR_START
