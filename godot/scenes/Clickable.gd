class_name Clickable
extends Area2D

signal pressed

@export var active = true

func _on_input_event(viewport, event, shape_idx):
	if not active:
		return
	#print_tree_pretty()
	#print(get_parent().get_parent())
	#if get_parent().get_name() != "InventoryArea":
	#	if get_inventory().is_open == true:
	#		return
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			#print("item print")
			pressed.emit()

func get_inventory():
	var inventory = null
	var current_node = self
	while (!inventory):
		inventory = current_node.get_node_or_null("Inventory")
		current_node = current_node.get_parent()
	return inventory
