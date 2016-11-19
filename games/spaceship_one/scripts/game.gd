extends Node

const GRUPO_INIMIGO = "inimigos"

func _ready():
	pass

func getCamera():
	return get_tree().get_root().get_node("main").get_node("camera")	
	pass