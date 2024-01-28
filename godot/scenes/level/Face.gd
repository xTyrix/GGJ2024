extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	remove_child(square)
	$Inventory/InventoryArea.add_child(square)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


var last_button = null
const NO = Color("ffffff")
const YES = Color("3e3e3e")

func _on_button_1_pressed():
	$Button1.active = false
	$Button1.modulate = NO
	if last_button:
		last_button.active = true
		last_button.modulate = YES
	last_button = $Button1
	check_solution()

func _on_button_2_pressed():
	$Button2.active = false
	$Button2.modulate = YES
	var temp = $MundLeft/yes.visible
	$MundLeft/no.visible = $MundRight/no.visible
	$MundLeft/yes.visible = $MundRight/yes.visible
	$MundRight/no.visible = !temp
	$MundRight/yes.visible = temp
	last_button = $Button2
	check_solution()

func _on_button_3_pressed():
	$Button3.active = false
	$Button3.modulate = NO
	$MundLeft/no.visible = false
	$MundLeft/yes.visible = true
	last_button = $Button3
	check_solution()

func check_solution():
	if !$Button1.active and !$Button2.active and !$Button3.active:
		if $MundLeft/yes.visible and $MundRight/yes.visible:
			pass # TODO win level
		else:
			reset_puzzle()

func reset_puzzle():
	last_button = null
	$Button1.active = true
	$Button1.modulate = YES
	$Button2.active = true
	$Button2.modulate = YES
	$Button3.active = true
	$Button3.modulate = YES
	$MundLeft/no.visible = true
	$MundLeft/yes.visible = false
	$MundRight/no.visible = true
	$MundRight/yes.visible = false
	
func start_puzzle():
	reset_puzzle()
	$Button1.visible = true
	$Button2.visible = true
	$Button3.visible = true
	$Button4.visible = true
	$Triangle.active = false
	$Square.active = false
	$Circle.active = false
	# TODO more?


@onready var triangle = $Triangle
func _on_slot_triangle_pressed():
	if $Inventory.active_sprite:
		if $Inventory.active_sprite_has_name("Triangle"):
			triangle.solved = true
			pass # TODO place triangle
			check_left_and_right()
		else:
			pass # TODO errrr

@onready var circle = $Circle
func _on_slot_circle_pressed():
	if $Inventory.active_sprite:
		if $Inventory.active_sprite_has_name("Circle"):
			circle.solved = true
			pass # TODO place circle
			check_left_and_right()
		else:
			pass # TODO errrr

@onready var square = $Square
func _on_slot_square_pressed():
	if $Inventory.active_sprite:
		if $Inventory.active_sprite_has_name("Square"):
			square.solved = true
			pass # TODO place square
			check_left_and_right()
		else:
			pass # TODO errrr

func check_left_and_right():
	pass
