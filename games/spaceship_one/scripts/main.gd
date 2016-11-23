
extends Node

# member variables here, example:
# var a=2
# var b="textvar"
var screen_size
var window_size

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	# begin_gambiarra > para centralizar a tela
	screen_size = OS.get_screen_size()
	window_size = OS.get_window_size()	
	OS.set_window_position(screen_size*0.5 - window_size*0.5)
	# end_gambiarra
	pass


