extends Node2D

var active_sprite = null

# Called when the node enters the scene tree for the first time.
func _ready():
	for n in 10:
		var node = get_node("%s" % n)
		node.pressed.connect(Callable(_on_slot_pressed).bind(node))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if active_sprite:
		var pos = get_viewport().get_mouse_position();
		active_sprite.position = pos + Vector2(15, 15)


func add_to_inventory(sprite):
	for n in 10:
		var node = get_node("%s" % n)
		if node.get_child_count() > 1:
			continue
		sprite.get_parent().remove_child(sprite)
		node.add_child(sprite)
		break

func _on_slot_pressed(node):
	if node.get_child_count() > 1:
		active_sprite = node.get_child(1)
		active_sprite.get_parent().remove_child(active_sprite)
		add_child(active_sprite)
