extends Item

var circle_active = false

func _on_pressed():
	if !circle_active and !get_parent().get_node("Inventory").active_sprite:
		circle_active = true
		get_parent().get_node("SlotCircle").active = true
	super._on_pressed()
