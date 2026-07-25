draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_set_alpha(intermission_text_alpha)

draw_text(room_width/2, room_height/2 - 10, $"Level {string(obj_level_manager.level)}")
draw_text(room_width/2, room_height/2 + 10, $"Lives: {string(obj_level_manager.player_lives)}")