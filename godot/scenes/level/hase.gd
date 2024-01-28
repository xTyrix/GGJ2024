extends Node2D
var fehlende_items=4

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_leiter_pressed():
	pass # Replace with function body.
	$Feder.active=true
	$Clickable.active=false


func _on_hase_pressed():
	if not ($Inventory.active_sprite_has_name("Zahnrad") or
			$Inventory.active_sprite_has_name("Blume") or
			$Inventory.active_sprite_has_name("Blume2") or
			$Inventory.active_sprite_has_name("Feder")):
		return
	
	$Inventory.clear_active_sprite()
	
	# TODO hase und mädchen sprites tauschen
	pass # Replace with function body.
	fehlende_items-=1
	print(fehlende_items)


func _on_leiter_vor_baum_pressed():
	if $Inventory.active_sprite_has_name("Leiter"):
		$Leiter_vor_Baum/Leiter2.visible = true
		$Inventory.clear_active_sprite()
		# TODO Feder aktivieren
		$Inventory
