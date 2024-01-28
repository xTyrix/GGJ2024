extends CanvasLayer

@export var connected_node_path: NodePath
@export var win_change_to_scene: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	var signal_node: Node = get_node(connected_node_path)
	signal_node.connect("puzzle_solved", _set_visible)

func _set_visible():
	visible = true

func _unhandled_key_input(event):
	if visible == true:
		if event.is_action_pressed("ui_accept"):
			get_tree().change_scene_to_packed(win_change_to_scene)
