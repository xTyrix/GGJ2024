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
	if not ($inventory.active_sprite_has_name("Zahnrad") or
			$inventory.active_sprite_has_name("Blume") or
			$inventory.active_sprite_has_name("Blume2") or
			$inventory.active_sprite_has_name("Feder")):
		return
	
	$inventory.clear_active_sprite()
	
	
	pass # Replace with function body.
	fehlende_items-=1
	print(fehlende_items)
