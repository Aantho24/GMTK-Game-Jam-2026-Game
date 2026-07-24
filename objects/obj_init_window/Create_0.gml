base_width = 320;
base_height = 180;

var max_x_scale = display_get_width() / base_width;
var max_y_scale = display_get_height() / base_height;

/*
	Stops the window from reaching beyond the display vertically.
	If the view scales to the display perfectly, the window's title bar
	will try to squish itself inside and mess up the scale.
*/
if frac(max_y_scale) == 0 {
	max_y_scale--;	
}

window_scale = floor(min(max_x_scale, max_y_scale));

window_set_size(base_width * window_scale, base_height * window_scale);
window_center();

/*
These are the lines causing the half-pixel sinking
surface_resize(application_surface, base_width * window_scale, base_height * window_scale)
display_set_gui_size(base_width, base_height);
*/
surface_resize(application_surface, base_width * window_scale, base_height * window_scale)
display_set_gui_size(base_width, base_height);