extends Node

var tickle1 = 3
var tickle2 = 3
var tickle3 = 3

signal puzzle_solved

var win_screen_visible: bool = false

func win_screen():
	if tickle1 + tickle2 + tickle3 == 0 and win_screen_visible == false:
		$"Fuss Lachen Win".play()
		print("you have solved this level")
		emit_signal("puzzle_solved")
		win_screen_visible = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	win_screen()

func reset():
	tickle1 = 3
	tickle2 = 3
	tickle3 = 3
	$VSlider.value = 0

func _on_fuss_tickle_1_pressed():
	if get_parent().get_node("Inventory").active_sprite_has_name("Feder"):
		if tickle1 <= 0:
			return
		tickle1 -= 1
		$VSlider.value += 10
	else:
		reset()

func _on_fuss_tickle_2_pressed():
	if get_parent().get_node("Inventory").active_sprite_has_name("Sonnenblume"):
		if tickle2 <= 0:
			return
		tickle2 -= 1
		$VSlider.value += 10
	else:
		reset()

func _on_fuss_tickle_3_pressed():
	if get_parent().get_node("Inventory").active_sprite_has_name("Kaktus"):
		if tickle3 <= 0:
			return
		tickle3 -= 1
		$VSlider.value += 10
	else:
		reset()
