extends Node


func _ready():

	pass

func geraMeteoros(valor):
	return get_children()[valor].duplicate()
	
func geraMeteoroRandomico():
	return get_children()[randi() % get_children().size()].duplicate()