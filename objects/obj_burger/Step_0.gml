state()

print($"bottom: {bottom_side_heat}, top: {top_side_heat}")

if state == state_cooking_bottom {
	burger_rotation = 0
} else if state == state_cooking_top {
	burger_rotation = 180
	// TODO: Add lerping to rotation
}

/*
Hate grilled = make grilled
Hate mayonaise = give tons of mayonaise

Order minigame:

Grill minigame:


Toppings minigame:
- Topping from spewing from above by guy that was hired, must