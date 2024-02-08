extends Node2D
var fehlende_items=4

signal puzzle_solved
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	$Hase/hase_animation.play("Hase_huepft")
	$Maedchen_Lachend/Maedchen_animation.play("maedchen_animation")


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
	fehlende_items-=1
	if fehlende_items==0:
		$Maedchen_Lachend.visible=true
		$Maedchen.visible=false
		$Hase_ganz.visible=true
		$Hase.visible=false
		$ChildLaughing.play()
		$Traene.emitting=false
		$Traene2.emitting=false
		emit_signal("puzzle_solved")


func _on_leiter_vor_baum_pressed():
	if $Inventory.active_sprite_has_name("Leiter"):
		$Leiter_vor_Baum/Leiter2.visible = true
		$Inventory.clear_active_sprite()

		$Feder.active=true
		$Clickable.active=false
