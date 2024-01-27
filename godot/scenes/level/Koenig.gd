extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var cat = true
func _on_hufeisen_pressed():
	if !cat:
		pass # TODO give hufeisen
		return
	if $Inventory.active_sprite:
		cat = false
		# TODO animation: move cat away
	else:
		pass # TODO miau


func _on_schluessel_pressed():
	pass # Replace with function body.


func _on_ritter_pressed():
	pass # Replace with function body.


func _on_schrank_pressed():
	pass # Replace with function body.


func _on_buecher_pressed():
	pass # Replace with function body.
