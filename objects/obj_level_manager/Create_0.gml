


toppings_selection = [obj_onion,obj_pickle,obj_tomato,obj_cheese,obj_lettuce]
create_random_toppings(9,toppings_selection)
ds_map_set(global.order_requirements,spr_onion,3)
ds_map_set(global.order_requirements,spr_pickle,3)
ds_map_set(global.order_requirements,spr_tomato,3)


X_CURSOR_START = 15
Y_CURSOR_START = 15

X_MARGIN = 15
Y_PADDING = 20
X_PADDING = 40

// 30 makes it vertical
MAX_WIDTH = 288

x_cursor = X_CURSOR_START
y_cursor = Y_CURSOR_START