extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func getCamera():
	return getMain().get_node("camera")	
	pass
	
func getMain():
	return get_tree().get_root().get_node("main")
	pass