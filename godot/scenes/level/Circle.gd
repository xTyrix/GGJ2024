extends Klotz

var coin_active = false

func _on_pressed():
	if !coin_active:
		coin_active = true
		get_parent().get_node("Coin1").was_just_put_away = true
		get_parent().get_node("Coin1").active = true
	super._on_pressed()
