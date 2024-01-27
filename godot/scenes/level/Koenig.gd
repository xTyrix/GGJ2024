extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var has_hufeisen = true
func _on_cat_pressed():
	if !has_hufeisen:
		$inventory.make_sprite_active($Hufeisen)
		return
	if $inventory.active_sprite_has_name("Wolle"):
		has_hufeisen = false
		$inventory.active_sprite.queue_free()
		$inventory.active_sprite = null
		$Cat/Wolle.visible = true
		$Hufeisen.position.y += 350
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
