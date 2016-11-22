extends Node

const GRUPO_INIMIGO = "inimigos"
const GRUPO_NAVE = "nave"

var score = 0 setget setScore, getScore

signal score_changed

func _ready():
	pass

func getCamera():
	return get_tree().get_root().get_node("main").get_node("camera")	
	pass
	
func setScore(valor):
	if valor > 0:
		score = valor
		emit_signal("score_changed")
	pass