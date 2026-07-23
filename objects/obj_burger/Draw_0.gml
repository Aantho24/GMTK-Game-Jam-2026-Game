var x_padding = sprite_width / 4
var y_padding = sprite_height / 10

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
draw_healthbar(x - x_padding, y - y_padding, x + x_padding - 1, y + y_padding - 1, heat, c_black, c_green, c_red, 0, true, true)