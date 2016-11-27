extends Node

var pre_meteor = preload("res://scenes/meteor.tscn")
var interval = 0
var spawner_active = true

func _ready():
	set_process(true)
	pass

func _process(delta):
	if spawner_active:
		# utiliza a variável interval para gerar meteoros 
		if interval > 0:
			interval -= delta
		else:
			interval = rand_range(game.meteor_interval_ini,game.meteor_interval_fim)
			var meteor = pre_meteor.instance()
			meteor.set_pos( Vector2(rand_range(30,OS.get_window_size().x), -40))
			get_owner().add_child(meteor)
	pass