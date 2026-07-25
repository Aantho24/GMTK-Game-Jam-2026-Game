level = 1
player_lives = 3

level_data = {
	"1" : {
		toppings_selection : [obj_pickle],
		maximum_toppings : 9,
		order_requirements: {
			spr_pickle : 1,
		},
	},
	"2" : {
		toppings_selection : [obj_onion],
		maximum_toppings : 9,
		order_requirements: {
			spr_onion : 1,
		},
	},
}

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