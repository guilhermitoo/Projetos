
extends Node2D

var vel = 350
var pre_tiro = preload("res://scenes/shoot.tscn")
var intervalo = 0.1
var ultimo_disparo = 0
var disparo_anterior

func _ready():
	set_process(true)
	pass
	
func _process(delta):
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
		
	# SE PRESSIONAR O BOTÃO DE DISPARO
	if Input.is_action_pressed("ui_action"):
		if ultimo_disparo <= 0:
			# verifica qual o disparo anterior para intercalar
			if disparo_anterior == get_node("position_cannon_left"):
				disparar(get_node("position_cannon_right"))
			else:
				disparar(get_node("position_cannon_left"))
			ultimo_disparo = intervalo
		pass
		
		
	if ultimo_disparo > 0:
		ultimo_disparo -= delta;
	
	pass

func disparar(node):
	# disparo_anterior recebe o node do disparo
	disparo_anterior = node
	# INSTANCIA O TIRO A PARTIR DO PRE_TIRO
	var tiro = pre_tiro.instance()
	# DEFINE A POSIÇÃO DELE NA POSIÇÃO DA NAVE
	tiro.set_global_pos(node.get_global_pos())
	# VICULA ELE NO MAIN
	get_owner().add_child(tiro)
	pass

