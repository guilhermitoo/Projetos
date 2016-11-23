extends Node

const GRUPO_INIMIGO = "inimigos"
const GRUPO_NAVE = "nave"

var score = 0 setget setScore
var pontuacao_por_meteoro = 1
var nave_vida = 5 setget setVidas
var chance_bonus = 20

signal score_changed
signal lifes_changed

func _ready():
	randomize()
	pass

func getCamera():
	return getMain().get_node("camera")	
	pass
	
func getMain():
	return get_tree().get_root().get_node("main")
	pass
	
func setScore(valor):
	if valor > 0:
		score = valor
		emit_signal("score_changed")
	pass
	
func setVidas(valor):
	nave_vida = valor
	emit_signal("lifes_changed")
	pass