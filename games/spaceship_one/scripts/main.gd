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
	
	# define o painel pause como oculto
	self.get_node("HUD/pause_menu").set_hidden(!get_tree().is_paused())
	
	game.alignGlobalCenter(self.get_node("HUD/pause_menu"))
	game.alignGlobalCenter(self.get_node("HUD/pause_menu/pause_play"))
	game.alignGlobalCenter(self.get_node("HUD/pause_menu/exit"))
	# end_gambiarra
	pass