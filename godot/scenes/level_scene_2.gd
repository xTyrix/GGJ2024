extends Node2D

const king_scene = "res://scenes/level/Koenig.tscn"
const bunny_scene = "res://scenes/level/hase.tscn"
const foot_scene = "res://scenes/level/Fuss.tscn"
const face_scene = "res://scenes/level/Face.tscn"

var next_scene = null
var new_game = true

func _ready() -> void:
	$UI/FadeOverlay.visible = true
	$UI/FadeOverlay.on_complete_fade_out.connect(_on_fade_overlay_on_complete_fade_out)

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_fade_overlay_on_complete_fade_out() -> void:
	if new_game and SaveGame.has_save():
		SaveGame.delete_save()
	get_tree().change_scene_to_file(next_scene)


func _on_king_pressed():
	next_scene = king_scene
	$UI/FadeOverlay.fade_out()

func _on_bunny_pressed():
	next_scene = bunny_scene
	$UI/FadeOverlay.fade_out()

func _on_foot_pressed():
	next_scene = foot_scene
	$UI/FadeOverlay.fade_out()

func _on_face_pressed():
	next_scene = face_scene
	$UI/FadeOverlay.fade_out()
