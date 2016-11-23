extends Node

var pre_meteor = preload("res://scenes/meteor.tscn")
var interval = 0

func _ready():
	set_process(true)
	pass

func _process(delta):
	# utiliza a variável interval para gerar meteoros 
	if interval > 0:
		interval -= delta
	else:
		interval = rand_range(0.8,2)
		var meteor = pre_meteor.instance()
		meteor.set_pos( Vector2(rand_range(30,610), -40))
		get_owner().add_child(meteor)
	pass