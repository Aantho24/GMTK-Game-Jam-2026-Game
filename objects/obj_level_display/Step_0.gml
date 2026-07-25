if time_source_get_state(obj_level_manager.begin_level_intermission) == time_source_state_stopped {
	intermission_text_alpha = lerp(intermission_text_alpha, 0, 0.2)
} else if time_source_get_state(obj_level_manager.begin_level_intermission) == time_source_state_active {
	intermission_text_alpha = 1
}