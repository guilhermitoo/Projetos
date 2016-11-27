extends "res://scripts/shoot.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	direction = 1
	set_process(true)
	get_node("sample").play("shoot4")
	pass
