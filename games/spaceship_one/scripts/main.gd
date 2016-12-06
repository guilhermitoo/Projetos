extends Node

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	# define o painel pause como oculto
	self.get_node("HUD/pause_menu").set_hidden(!get_tree().is_paused())
	
	game.alignGlobalCenter(self.get_node("HUD/pause_menu"))
	game.alignGlobalCenter(self.get_node("HUD/pause_menu/pause_play"))
	game.alignGlobalCenter(self.get_node("HUD/pause_menu/exit"))
	
	get_node("sample").play("Orbital_Colossus_0")
	
	pass