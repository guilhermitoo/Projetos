extends Node

var prefabrica = preload("res://scenes/fabrica_meteoros.tscn")
var fabrica

func _ready():
	set_process(true)
	fabrica = prefabrica.instance()
	pass

func _on_Timer_timeout():
	get_node("Timer").set_wait_time(rand_range(game.meteor_interval_ini,game.meteor_interval_fim))
	var meteor = fabrica.geraMeteoroRandomico()
	meteor.set_pos( Vector2(rand_range(30,OS.get_window_size().x), -40))
	get_owner().add_child(meteor)
	pass
