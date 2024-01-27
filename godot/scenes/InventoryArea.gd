extends Node2D

var inventory_extended = false

func _ready():
	position += Vector2(100,100)

func _on_area_2d_mouse_entered():
	if not inventory_extended:
		position -= Vector2(100,100)
		inventory_extended = true


func _on_area_2d_2_mouse_exited():
	if  inventory_extended:
		position += Vector2(100,100)
		inventory_extended = false
