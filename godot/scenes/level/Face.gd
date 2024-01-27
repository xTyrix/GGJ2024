extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Inventory.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


var last_button = null

func _on_button_1_pressed():
	$Button1.active = false
	$MundLeft/no.visible = false
	$MundLeft/yes.visible = true
	# TODO animation button
	last_button = $Button1
	check_solution()

func _on_button_2_pressed():
	$Button2.active = false
	var temp = $MundLeft/yes.visible
	$MundLeft/no.visible = $MundRight/no.visible
	$MundLeft/yes.visible = $MundRight/yes.visible
	$MundRight/no.visible = !temp
	$MundRight/yes.visible = temp
	# TODO animation button
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
		if $MundLeft/yes.visible and $MundRight/yes.visible:
			pass # TODO win level
		else:
			reset_puzzle()

func reset_puzzle():
	last_button = null
	$Button1.active = true
	$Button2.active = true
	$Button3.active = true
	$MundLeft/no.visible = true
	$MundLeft/yes.visible = false
	$MundRight/no.visible = true
	$MundRight/yes.visible = false
	# TODO animations for buttons


func _on_slot_triangle_pressed():
	if $Inventory.active_sprite:
		if $Inventory.active_sprite_has_name("Triangle"):
			pass # TODO place triangle
		else:
			pass # TODO errrr

func _on_slot_circle_pressed():
	if $Inventory.active_sprite:
		if $Inventory.active_sprite_has_name("Circle"):
			pass # TODO place circle
		else:
			pass # TODO errrr

func _on_slot_square_pressed():
	if $Inventory.active_sprite:
		if $Inventory.active_sprite_has_name("Square"):
			pass # TODO place square
		else:
			pass # TODO errrr
