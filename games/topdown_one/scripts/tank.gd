extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var speed = 1200
var hitpoints = 350

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	add_to_group(game.GROUP_TANK)
	pass
	
func _process(delta):
	Movement(delta)
	pass
	
func Movement(delta):
	var v2 = get_node(".").get_pos()
	var m = (speed/10) * delta
	if Input.is_action_pressed("ui_up"):
		v2.y -= m
	if Input.is_action_pressed("ui_down"):
		v2.y += m
	if Input.is_action_pressed("ui_right"):
		v2.x += m
	if Input.is_action_pressed("ui_left"):
		v2.x -= m
	get_node(".").set_pos(v2)
	pass

func DealDamage(damage):
	hitpoints -= damage
	pass