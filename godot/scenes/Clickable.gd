extends Area2D

signal pressed

@export var active = true

var mouse_hover = false

func _ready():
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _input(event):
	if not (active and mouse_hover):
		return

	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			pressed.emit()

func _on_mouse_entered():
	mouse_hover = true

func _on_mouse_exited():
	mouse_hover = false
