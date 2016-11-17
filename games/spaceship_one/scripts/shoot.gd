
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"
var vel = 600

func _ready():
	set_process(true)
	pass

func _process(delta):
	set_pos(get_pos() + Vector2(0,-1) * vel * delta)
	
	if get_pos().y < - 30:
		free()
	
	pass
