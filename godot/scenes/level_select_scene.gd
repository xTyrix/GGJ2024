extends Node2D

@export var koenig_scene:PackedScene
@export var hase_scene:PackedScene
@export var fuss_scene:PackedScene
@export var face_scene:PackedScene

@export var menu_scene:PackedScene

@onready var overlay := %FadeOverlay
@onready var continue_button := %ContinueButton
@onready var new_game_button := %NewGameButton
@onready var settings_button := %SettingsButton
@onready var exit_button := %ExitButton

var next_scene = null
var new_game = true

func _ready() -> void:
	overlay.visible = true
	overlay.on_complete_fade_out.connect(_on_fade_overlay_on_complete_fade_out)
	
	
func _on_back_button_pressed() -> void:
	get_tree().quit()

func _on_fade_overlay_on_complete_fade_out() -> void:
	if new_game and SaveGame.has_save():
		SaveGame.delete_save()
	get_tree().change_scene_to_packed(next_scene)


func _on_koenig_pressed():
	next_scene = koenig_scene
	overlay.fade_out()


func _on_hase_pressed():
	next_scene = hase_scene
	overlay.fade_out()


func _on_fuss_pressed():
	next_scene = fuss_scene
	overlay.fade_out()


func _on_face_pressed():
	next_scene = face_scene
	overlay.fade_out()


func _on_back_pressed():
	next_scene = menu_scene
	overlay.fade_out()
