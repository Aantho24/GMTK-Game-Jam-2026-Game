audio_stop_all();

switch (room)
{
    case room_title_screen:
        audio_play_sound(mus_title_screen, 0, true)
    break

    case room_grill:
        audio_play_sound(mus_game, 0, true)
    break
	
	case room_congrats:
		audio_play_sound(mus_congrats, 0, false)
	break
	
	case room_game_over:
		audio_play_sound(mus_game_over, 0, false)
	break

    default:
        audio_play_sound(mus_game, 0, true)
}