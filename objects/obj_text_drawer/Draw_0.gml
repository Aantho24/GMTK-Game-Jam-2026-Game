draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_set_font(font_tally)

if room == room_game_over {
	draw_text(room_width / 2,96,$"You reached Level {global.highest_level_reached}!")
} else if room == room_congrats {
	draw_text(room_width / 2,100,"When the odds were stacked against you,")
	draw_text(room_width / 2,116,"you stacked higher. Thanks for playing!")
}