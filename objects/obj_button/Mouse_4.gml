if room == room_congrats {
	room_goto(room_title_screen)
} else if room_exists(room_next(room)) {
	room_goto_next()
} else {
	room_goto(room_first)
}