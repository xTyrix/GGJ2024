extends Node2D

var laught_meter = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass # Replace with function body.

func has_won():
	if laught_meter < 90:
		return false
	else:
		return true

func _on_schrank_pressed():
	$Schrank.active = false
	$Schrank/SchrankOpen.visible = true
	$Schrank/SchrankClosed.visible = false
	$Feder.visible = true


func _on_fuss_tickle_1_pressed():
	if $Inventory.active_sprite_has_name("Feder"):
		laught_meter += 10
	else:
		laught_meter -= 20
	has_won()

func _on_fuss_tickle_2_pressed():
	if $Inventory.active_sprite_has_name("Feder"):
		laught_meter += 10
	else:
		laught_meter -= 20
	has_won()

func _on_fuss_tickle_3_pressed():
	if $Inventory.active_sprite_has_name("Feder"):
		laught_meter += 10
	else:
		laught_meter -= 20
	has_won()
