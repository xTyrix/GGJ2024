extends Node2D


func test_win():
	if tickle1 + tickle2 + tickle3 == 0:
		print("you have won this level")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
var tickle1 = 3
var tickle2 = 3
var tickle3 = 3

func reset():
	tickle1 = 3
	tickle2 = 3
	tickle3 = 3

func _on_fuss_tickle_1_pressed():
	if tickle1 <= 0:
		test_win()
		return
	if $Inventory.active_sprite_has_name("Feder"):
		tickle1 -= 1
	else:
		reset()

func _on_fuss_tickle_2_pressed():
	if tickle2 <= 0:
		test_win()
		return
	if $Inventory.active_sprite_has_name("Feder"):
		tickle2 -= 1
	else:
		reset()

func _on_fuss_tickle_3_pressed():
	if tickle3 <= 0:
		test_win()
		return
	if $Inventory.active_sprite_has_name("Feder"):
		tickle3 -= 1
	else:
		reset()
