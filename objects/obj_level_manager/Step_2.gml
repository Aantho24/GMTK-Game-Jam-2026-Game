if are_maps_equal(global.stacked_toppings_tally, global.order_requirements) {
	var max_level = struct_names_count(level_data)
	level++
	
	if level > struct_names_count(level_data) {
		draw_set_alpha(1)
		room_goto(room_congrats)
	} else {
		level = min(level, max_level)
		if level % 5 == 0 player_lives++
		goto_level(level)
	}
		
}

for (var k = ds_map_find_first(global.stacked_toppings_tally); !is_undefined(k); k = ds_map_find_next(global.stacked_toppings_tally, k)) {
	var v = global.stacked_toppings_tally[? k];
	
	if !ds_map_exists(global.order_requirements, k) 
	or (ds_map_exists(global.order_requirements, k) and (global.order_requirements[? k] - v < 0)) {
		player_lives--
		play_topping_collect_sound = false
		audio_play_sound(snd_hit,0,false)
		
		if player_lives < 0 {
			draw_set_alpha(1)
			global.highest_level_reached = level
			room_goto(room_game_over)
		} else {
			goto_level(level)
		}
	}
} 

if play_topping_collect_sound == true {
	audio_play_sound_ext({ 
		sound : snd_collect_topping,
		pitch : 1 + (count_sum_of_collected_toppings() / count_sum_of_required_toppings()),
	})
	play_topping_collect_sound = false
}