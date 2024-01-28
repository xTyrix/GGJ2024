extends Node2D

@export var king_scene:PackedScene
@export var bunny_scene:PackedScene
@export var foot_scene:PackedScene
@export var face_scene:PackedScene

@onready var overlay := %FadeOverlay

var next_scene = null
var new_game = true

func _ready() -> void:
	overlay.visible = true
	overlay.on_complete_fade_out.connect(_on_fade_overlay_on_complete_fade_out)

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_fade_overlay_on_complete_fade_out() -> void:
	if new_game and SaveGame.has_save():
		SaveGame.delete_save()
	get_tree().change_scene_to_packed(next_scene)


func _on_king_pressed():
	next_scene = king_scene
	overlay.fade_out()

func _on_bunny_pressed():
	next_scene = bunny_scene
	overlay.fade_out()

func _on_foot_pressed():
	next_scene = foot_scene
	overlay.fade_out()

func _on_face_pressed():
	next_scene = face_scene
	overlay.fade_out()
