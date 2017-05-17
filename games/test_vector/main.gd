extends Node


# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var pos = Vector2( )
var pre_tiro = preload("res://tiro.tscn");

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	set_process(true)
	pass	

func _process(delta):
	if Input.is_action_pressed("shoot"):
		var scalar = get_node("Area2D").get_global_pos().dot(game.getCamera().get_global_mouse_pos())
		var tiro = pre_tiro.instance(scalar)
		tiro.set_pos(get_node("Area2D").get_global_pos())
		game.getMain().add_child(tiro)