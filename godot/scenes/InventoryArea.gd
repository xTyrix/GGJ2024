extends Node2D

var inventory_extended = false

var offset = Vector2(350, 350)

var original_position
var hidden_position
var target_position

func _ready():
	original_position =  position
	hidden_position = position + offset
	target_position = hidden_position

func _process(delta):
	position = lerp(position, target_position, 0.2)

func _on_area_2d_mouse_entered():
	target_position = original_position


func _on_area_2d_2_mouse_exited():
	target_position = hidden_position
