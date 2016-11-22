extends "res://scripts/shoot.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_process(true)
	get_node("sample").play("shoot2")
	pass