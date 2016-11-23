extends Node

const GRUPO_INIMIGO = "inimigos"
const GRUPO_NAVE = "nave"

var score = 0 setget setScore
var pontuacao_por_meteoro = 1
var nave_vida = 5 setget setVidas
var chance_bonus = 100
# libera os objetos que passarem da margem da tela + margem_acrescida_tela
var margem_acrescida_tela = 50

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
	
func estaForaTela(node):
	var retorno = false
	var tamanho_tela = OS.get_screen_size()
	var local_no = node.get_global_pos()
	retorno = retorno or ( local_no.x > (tamanho_tela.x+margem_acrescida_tela) )
	retorno = retorno or ( local_no.x < -margem_acrescida_tela ) 
	retorno = retorno or ( local_no.y > (tamanho_tela.y+margem_acrescida_tela) ) 
	retorno = retorno or ( local_no.y < -margem_acrescida_tela )
	return retorno
	pass