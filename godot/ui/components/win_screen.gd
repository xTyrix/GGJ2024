extends CanvasLayer

const win_change_to_scene = "res://scenes/level_scene_2.tscn"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().connect("puzzle_solved", _set_visible)

func _set_visible():
	visible = true

func _unhandled_key_input(event):
	if visible == true:
		if event.is_action_pressed("ui_accept"):
			get_tree().change_scene_to_file(win_change_to_scene)
