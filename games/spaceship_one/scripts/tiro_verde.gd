extends "res://scripts/shoot.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# inicia o dano do tiro verde
	dano = 1.5
	
	set_process(true)
	get_node("sample").play("shoot3")
	pass