extends Node


# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var pos = Vector2( )
var pre_tiro = preload("res://tiro.tscn");
var delay = 0;
var speed = 1000

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	pass	

func _process(delta):
	get_node("Area2D/Sprite").look_at(get_node("Area2D").get_global_mouse_pos())
	var character = get_node("Area2D")
	var mouseglobal = get_node("Area2D").get_global_mouse_pos()
	var mouselocal = get_node("Area2D").get_local_mouse_pos()
	
	# MOVIMENTAÇÃO
	if Input.is_action_pressed("ui_up"):
		character.translate(Vector2(0,-1)*delta*speed)
	if Input.is_action_pressed("ui_down"):
		character.translate(Vector2(0,1)*delta*speed)
	if Input.is_action_pressed("ui_left"):
		character.translate(Vector2(-1,0)*delta*speed)
	if Input.is_action_pressed("ui_right"):
		character.translate(Vector2(1,0)*delta*speed)
	
	if Input.is_action_pressed("shoot"):
		delay -= delta;
		if delay <= 0:
			var tiro = pre_tiro.instance()
			tiro.set_pos(character.get_global_pos())
			tiro.look_at(mouseglobal)
			game.getMain().add_child(tiro)
			tiro.mousepos = mouselocal
			delay = 0.1;
		