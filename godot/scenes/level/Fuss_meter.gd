extends Node2D


var meter = 0: set = limit_health

func limit_health(new_val):
	if new_val < meter && new_val < 0:
		meter = 0 
	if new_val > meter && new_val >= 90:
		pass # Win condition

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
var tickle1 = 3
var tickle2 = 3
var tickle3 = 3

func _on_fuss_tickle_1_pressed():
	if tickle1 <= 0:
		return
	if $Inventory.active_sprite_has_name("Feder"):
		meter += 10
		tickle1 -= 1
	else:
		meter -= 90
		tickle1 = 3
		tickle2 = 3
		tickle3 = 3

func _on_fuss_tickle_2_pressed():
	if tickle2 <= 0:
		return
	if $Inventory.active_sprite_has_name("Feder"):
		meter += 10
		tickle2 -= 1
	else:
		meter -= 90
		tickle1 = 3
		tickle2 = 3
		tickle3 = 3

func _on_fuss_tickle_3_pressed():
	if tickle3 <= 0:
		return
	if $Inventory.active_sprite_has_name("Feder"):
		meter += 10
		tickle3 -= 1
	else:
		meter -= 90
		tickle1 = 3
		tickle2 = 3
		tickle3 = 3
