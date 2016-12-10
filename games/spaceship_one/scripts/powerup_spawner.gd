extends Node

var pre_pu = preload("res://scenes/powerup_basic_shield.tscn")
var interval = 0
var spawner_active = true

func _ready():
	set_process(true)
	pass

func _process(delta):
	if spawner_active:
		# utiliza a variável interval para gerar 
		if interval > 0:
			interval -= delta
		else:
			interval = rand_range(game.pu_interval_ini,game.pu_interval_fim)
			var pu = pre_pu.instance()
			pu.set_pos( Vector2(rand_range(30,OS.get_window_size().x), -40))
			game.getMain().add_child(pu)
	pass