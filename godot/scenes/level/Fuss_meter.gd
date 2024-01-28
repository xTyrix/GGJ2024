extends Node


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
	$VSlider.value = 0

func _on_fuss_tickle_1_pressed():
	if get_parent().get_node("Inventory").active_sprite_has_name("Feder"):
		if tickle1 <= 0:
			test_win()
			return
		tickle1 -= 1
		$VSlider.value += 10
	else:
		reset()

func _on_fuss_tickle_2_pressed():
	if get_parent().get_node("Inventory").active_sprite_has_name("Sonnenblume"):
		if tickle2 <= 0:
			test_win()
			return
		tickle2 -= 1
		$VSlider.value += 10
	else:
		reset()

func _on_fuss_tickle_3_pressed():
	if get_parent().get_node("Inventory").active_sprite_has_name("Kaktus"):
		if tickle3 <= 0:
			test_win()
			return
		tickle3 -= 1
		$VSlider.value += 10
	else:
		reset()
