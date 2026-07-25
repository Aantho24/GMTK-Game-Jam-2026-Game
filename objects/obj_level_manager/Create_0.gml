level = 1

level_data = {
	"1" : {
		toppings_selection : [obj_onion,obj_pickle,obj_tomato,obj_cheese,obj_lettuce],
		maximum_toppings : 9,
		order_requirements: {
			spr_onion : 1,
			spr_pickle : 2,
		},
	},
	"2" : {
		toppings_selection : [obj_tomato],
		maximum_toppings : 9,
		order_requirements: {
			spr_onion : 3,
			spr_pickle : 4,
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