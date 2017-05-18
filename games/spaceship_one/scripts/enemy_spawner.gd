extends Node2D

var pre_inimigo = preload("res://scenes/inimigos/path_enemy.tscn")

func _ready():
	randomize_timer()
	pass
	
func randomize_timer():
	get_node("Timer").set_wait_time(rand_range(2,10))

func _on_Timer_timeout():
	var inimigo = pre_inimigo.instance()
	get_parent().add_child(inimigo)
	randomize_timer()
	pass # replace with function body
