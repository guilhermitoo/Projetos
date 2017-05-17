extends Node


# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var pos = Vector2( )
var pre_tiro = preload("res://tiro.tscn");
var delay = 0;

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	set_process(true)
	pass	

func _process(delta):
	
	if Input.is_action_pressed("shoot"):
		delay -= delta;
		if delay <= 0:
			var origin = Vector2(1,0)
			var a = get_node("Area2D").get_global_pos()
			# b = mouse
			var b = get_node("Area2D").get_global_mouse_pos()

			var tiro = pre_tiro.instance()

			var ang = a.angle_to_point(b)
			tiro.set_pos(get_node("Area2D").get_global_pos())
			
			tiro.look_at(b)
			game.getMain().add_child(tiro)
			tiro.mousepos = get_node("Area2D").get_local_mouse_pos()
			delay = 0.1;
		