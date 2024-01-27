extends Node2D

var active_sprite: Node = null
var active_slot: Node = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#for n in 10:
	#	var node = get_node("%s" % n)
	#	node.pressed.connect(Callable(_on_slot_pressed).bind(node))

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			put_back()

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

func get_active_sprite():
	return active_sprite
	
func clear_active_sprite():
	active_sprite.queue_free()

func put_back():
	if not active_sprite:
		return

	active_sprite.position = Vector2(0, 0)
	active_sprite.get_parent().remove_child(active_sprite)
	active_slot.add_child(active_sprite)
	
	active_sprite = null
	active_slot = null

func _on_slot_pressed(node):
	if node.get_child_count() > 1:
		put_back()
		
		active_slot = node
		active_sprite = node.get_child(1)
		active_sprite.get_parent().remove_child(active_sprite)
		add_child(active_sprite)

			
