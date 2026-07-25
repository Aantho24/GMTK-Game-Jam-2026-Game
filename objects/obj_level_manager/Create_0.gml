level = 1
player_lives = 3

// default speed: 2
// default max: 9

level_data = {
	"1" : {
		toppings_selection : [obj_cheese],
		maximum_toppings : 8,
		topping_speed : 2,
		order_requirements: {
			spr_cheese : 4,
		},
	},
	"2" : {
		toppings_selection : [obj_onion],
		maximum_toppings : 9,
		topping_speed : 2,
		order_requirements: {
			spr_onion : 1,
		},
	},
}

var LEVEL_INTERMISSION_WAIT_PERIOD_SECONDS = 2
begin_level_intermission = time_source_create(time_source_game, LEVEL_INTERMISSION_WAIT_PERIOD_SECONDS, time_source_units_seconds, function() {
	// Sets maximum toppings to the one set in the given level's level data
	var toppings_selection = level_data[$ level].toppings_selection
	var max_toppings = level_data[$ level].maximum_toppings
	create_random_toppings(max_toppings,toppings_selection)	
})

goto_level(level)


X_CURSOR_START = 15
Y_CURSOR_START = 15

X_MARGIN = 15
Y_PADDING = 20
X_PADDING = 40

// 30 makes it vertical
MAX_WIDTH = 288

x_cursor = X_CURSOR_START
y_cursor = Y_CURSOR_START