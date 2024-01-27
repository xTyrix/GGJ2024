extends Node2D

var inventory_extended = false

var offset = Vector2(350, 350)

func _ready():
	position += offset

func _on_area_2d_mouse_entered():
	if not inventory_extended:
		position -= offset
		inventory_extended = true


func _on_area_2d_2_mouse_exited():
	if  inventory_extended:
		position += offset
		inventory_extended = false
