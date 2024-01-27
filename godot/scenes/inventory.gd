extends Node2D

var active_sprite: Node = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if active_sprite:
		var pos = get_viewport().get_mouse_position();
		active_sprite.position = pos + Vector2(10, 10)
	
func make_sprite_active(sprite):
	sprite.get_parent().remove_child(sprite)
	add_child(sprite)
	active_sprite = sprite

func active_sprite_has_name(name):
	return active_sprite != null and active_sprite.name == name

func clear_active_sprite():
	active_sprite.queue_free()
	active_sprite = null

func add_sprite_to_inventory(sprite):
	sprite.position = get_local_mouse_position()
	sprite.get_parent().remove_child(sprite)
	$InventoryArea/Area2D.add_child(sprite)

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if active_sprite:
				add_sprite_to_inventory(active_sprite)
				active_sprite = null
