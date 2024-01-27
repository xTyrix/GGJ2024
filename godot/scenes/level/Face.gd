extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


var left_up = false
var right_up = false
var last_button = null

func _on_button_1_pressed():
	$Button1.active = false
	left_up = true
	# TODO animation left + button
	last_button = $Button1
	check_solution()

func _on_button_2_pressed():
	$Button2.active = false
	var temp = left_up
	left_up = right_up
	right_up = temp
	# TODO animation left + right + button
	last_button = $Button2
	check_solution()

func _on_button_3_pressed():
	$Button3.active = false
	# TODO animation button
	if last_button:
		last_button.active = true
		# TODO animation button
	last_button = $Button3
	check_solution()

func check_solution():
	if !$Button1.active and !$Button2.active and !$Button3.active:
		if left_up and right_up:
			pass # TODO win level
		else:
			reset_puzzle()

func reset_puzzle():
	last_button = null
	$Button1.active = true
	$Button2.active = true
	$Button3.active = true
	left_up = false
	right_up = false
	# TODO animations for all


func _on_slot_triangle_pressed():
	pass # Replace with function body.

func _on_slot_circle_pressed():
	pass # Replace with function body.

func _on_slot_square_pressed():
	pass # Replace with function body.
