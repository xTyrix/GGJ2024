extends Node2D

func _ready():
	remove_child(square)
	$Inventory/InventoryArea.add_child(square)


var last_button = null
const YES = Color("ffffff")
const NO = Color("3e3e3e")

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
	$Button2.modulate = NO
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
	# deactivate left and right puzzles
	$Triangle.active = false
	$Square.active = false
	$Circle.active = false
	$SlotTriangle.active = false
	$SlotCircle.active = false
	$SlotSquare.active = false
	$Slot.active = false
	
	# activate last puzzle
	$Button1.visible = true
	$Button2.visible = true
	$Button3.visible = true
	$Button4.visible = true
	reset_puzzle()


@onready var triangle = $Triangle
func _on_slot_triangle_pressed():
	if $Inventory.active_sprite_has_name("Triangle") and !triangle.was_just_put_away:
		triangle.solved = true
		$Inventory.active_sprite = null
		triangle.get_parent().remove_child(triangle)
		add_child(triangle)
		triangle.set_global_position(Vector2(219, 531))
		check_left_and_right()
	elif $Inventory.active_sprite:
		pass # TODO errrr

@onready var circle = $Circle
func _on_slot_circle_pressed():
	if $Inventory.active_sprite_has_name("Circle") and !circle.was_just_put_away:
		circle.solved = true
		$Inventory.active_sprite = null
		circle.get_parent().remove_child(circle)
		add_child(circle)
		circle.set_global_position(Vector2(195, 817))
		check_left_and_right()
	elif $Inventory.active_sprite:
		pass # TODO errrr

@onready var square = $Square
func _on_slot_square_pressed():
	if $Inventory.active_sprite_has_name("Square") and !square.was_just_put_away:
		square.solved = true
		$Inventory.active_sprite = null
		square.get_parent().remove_child(square)
		add_child(square)
		square.set_global_position(Vector2(206, 248))
		check_left_and_right()
	elif $Inventory.active_sprite:
		pass # TODO errrr

var coins = 0
var green_light = load("res://sprites/Puzzlebox/Lampe-gruen.png")
func _on_slot_pressed():
	var is_coin = $Inventory.active_sprite_has_name("Coin1")
	is_coin = is_coin or $Inventory.active_sprite_has_name("Coin2")
	is_coin = is_coin or $Inventory.active_sprite_has_name("Coin3")
	if is_coin:
		var coin = $Inventory.active_sprite
		$Inventory.active_sprite = null
		coin.queue_free()
		coins += 1
		if coins in range(1, 4):
			$Lamps.get_node(str(coins)).texture = green_light
		check_left_and_right()
	elif $Inventory.active_sprite:
		pass # TODO errrr

func check_left_and_right():
	var solved = coins >= 3
	solved = solved and triangle.solved
	solved = solved and circle.solved
	solved = solved and square.solved
	if solved:
		start_puzzle()
