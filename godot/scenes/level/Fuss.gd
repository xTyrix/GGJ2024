extends Node2D

var laught_meter = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass # Replace with function body.


func _on_schrank_pressed():
	$Schrank.active = false
	$Schrank/SchrankOpen.visible = true
	$Schrank/SchrankClosed.visible = false
	$Feder.visible = true
