extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var cat_has_hufeisen = true
func _on_cat_pressed():
	if !cat_has_hufeisen:
		pass # TODO miau
		return
	if $Inventory.active_sprite_has_name("Wolle"):
		cat_has_hufeisen = false
		var wolle = $Inventory.active_sprite
		$Inventory.active_sprite = null
		wolle.queue_free()
		$Hufeisen.active = true
		$Inventory.make_sprite_active($Hufeisen)
		$Cat/Wolle.visible = true
	else:
		pass # TODO miau


func _on_schluessel_pressed():
	pass # Replace with function body.


func _on_ritter_pressed():
	if not $Inventory.active_sprite_has_name("Magnet"):
		return

	$Inventory.clear_active_sprite()

	$Ritter2.visible = false
	$RitterNackt.visible = true
	$Koenig/Kopf.visible = false
	$Koenig/KoenigKopfGluecklich.visible = true


func _on_schrank_pressed():
	if not $Inventory.active_sprite_has_name("Schluessel"):
		return
		
	$Inventory.clear_active_sprite()

	$Tuer.visible = false
	$Buecher.active = true

func _on_buecher_pressed():
	pass # Replace with function body.
