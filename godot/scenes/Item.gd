extends Clickable


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_pressed():
	var inventory
	var current_node = self
	while (!inventory):
		inventory = current_node.get_node("inventory")
		current_node = current_node.get_parent()
	inventory.make_sprite_active(self)
	
