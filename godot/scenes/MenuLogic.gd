extends Node2D

var level_select_scene = preload("res://scenes/level_select_scene.tscn")
var main_menu_scene = preload("res://scenes/main_menu_scene.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func go_back_to_level_select():
	$Timer.start()


func _on_timer_timeout():
	$FadeOverlay.fade_out()


func _on_fade_overlay_on_complete_fade_out():
	get_tree().change_scene_to_packed(level_select_scene)
