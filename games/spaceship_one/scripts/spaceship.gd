
extends Node2D

var vel = 350
var arma
var tiro_simples = preload("res://scripts/classes/armas/tiro_simples.gd")
var tiro_rapido = preload("res://scripts/classes/armas/tiro_rapido.gd")
var tiro_duplo = preload("res://scripts/classes/armas/tiro_duplo.gd")

func _ready():
	self.add_to_group(game.GRUPO_NAVE)
	set_process(true)
	arma = tiro_simples.new(self)
	pass
	
func _process(delta):
	
	# função criada apenas para separar o código de controle de direção da nave
	ControlarDirecao(delta)

	# SE PRESSIONAR O BOTÃO DE DISPARO
	if Input.is_action_pressed("ui_action"):
		arma.disparar()
		pass
		
		
	arma.atualizar(delta)
	
	pass
	
	
func ControlarDirecao(delta):
	var right = 0
	var left = 0
	
	# CONTROLE DE DIREÇÃO DIREITA E ESQUERDA
	if (Input.is_action_pressed("ui_right")):
		right = 1 # direita soma X
	if (Input.is_action_pressed("ui_left")):
		left = -1 # esquerda subtrai X
		
	# IMPEDE QUE A NAVE SAIA DA TELA
	if get_pos().x > (OS.get_window_size().x - 50):
		right = 0
	if get_pos().x < (50):
		left = 0
	
	# DIREÇÃO DIREITA E ESQUERDA
	set_pos(get_pos() + Vector2(1, 0) * vel * delta * (right + left))
		
	pass
	
func set_arma(valor):
	
	if valor == 1:
		arma = tiro_rapido.new(self)
	elif valor == 2:
		arma = tiro_duplo.new(self)
		
	pass