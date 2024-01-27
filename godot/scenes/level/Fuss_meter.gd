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

func _on_fuss_tickle_1_pressed():
	if $Inventory.active_sprite_has_name("Feder"):
		meter += 10
	else:
		meter -= 20

func _on_fuss_tickle_2_pressed():
	if $Inventory.active_sprite_has_name("Feder"):
		meter += 10
	else:
		meter -= 20

func _on_fuss_tickle_3_pressed():
	if $Inventory.active_sprite_has_name("Feder"):
		meter += 10
	else:
		meter -= 20
