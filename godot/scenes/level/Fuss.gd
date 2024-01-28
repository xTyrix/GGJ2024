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

func _on_rucksack_pressed():
	$Rucksack.active = false
	$Rucksack/RucksackUmgekippt.visible = true
	$Rucksack/RucksackHochkant.visible = false
	$Sonnenblume.visible = true

func _on_ordner_pressed():
	$Ordner.active = false
	$Ordner/OrdnerUmgekippt.visible = true
	$Ordner/OrdnerHochkant.visible = false
	$Kaktus.visible = true
