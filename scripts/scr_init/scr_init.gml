#macro print show_debug_message

randomize()

global.stacked_toppings = []

global.stacked_toppings_tally = ds_map_create()

global.order_requirements = ds_map_create()

global.highest_level_reached = 0