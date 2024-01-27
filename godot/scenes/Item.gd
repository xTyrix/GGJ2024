extends Clickable


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
var was_just_put_away = false
var just_taken = false
func _process(delta):
	was_just_put_away = false
	just_taken = false

func _on_pressed():
	if just_taken:
		return
	var inventory = null
	var current_node = self
	while (!inventory):
		inventory = current_node.get_node_or_null("Inventory")
		current_node = current_node.get_parent()
	inventory.make_sprite_active(self)
	was_just_put_away = true
	
