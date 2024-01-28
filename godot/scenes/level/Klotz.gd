extends Item

@export var solved = false

func _on_pressed():
	solved = false
	super._on_pressed()
