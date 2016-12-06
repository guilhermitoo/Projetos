extends "res://scripts/powerup.gd"

func _ready():
	get_node("anim").play("shine")
	set_process(true)
	pass
