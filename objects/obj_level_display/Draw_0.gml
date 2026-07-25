draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_set_alpha(intermission_text_alpha)

draw_text(room_width/2, room_height/2 - 10, $"Level {string(obj_level_manager.level)}")
draw_text(room_width/2, room_height/2 + 10, $"Lives: {string(obj_level_manager.player_lives)}")

if obj_level_manager.level == 1 and intermission_text_alpha <= 0.1 {
	draw_set_halign(fa_center)
	draw_set_valign(fa_center)
	draw_set_alpha(1)
	draw_text(room_width/2, room_height/2 + 10, $"To win, grill the patty to the max,")
	draw_text(room_width/2, room_height/2 + 30, $"and get all the needed toppings!")
}