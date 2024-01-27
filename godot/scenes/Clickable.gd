class_name Clickable
extends Area2D

signal pressed

@export var active = true

func _on_input_event(viewport, event, shape_idx):
	if not active:
		return

	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			#print("item print")
			pressed.emit()
