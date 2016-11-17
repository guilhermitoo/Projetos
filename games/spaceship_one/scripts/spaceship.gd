
extends Node2D

var vel = 300
var pre_tiro = preload("res://scenes/shoot.tscn")
var intervalo = 0.3
var ultimo_disparo = 0

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
		
	if get_pos().x > (1024 - 50):
		right = 0
	if get_pos().x < (50):
		left = 0
		
	set_pos(get_pos() + Vector2(vel, 0) * delta * (right + left))
		
	# SE PRESSIONAR O BOTÃO DE DISPARO
	if Input.is_action_pressed("ui_action"):
		if ultimo_disparo <= 0:
			# INSTANCIA O TIRO A PARTIR DO PRE_TIRO
			var tiro = pre_tiro.instance()
			# DEFINE A POSIÇÃO DELE NA POSIÇÃO DA NAVE
			tiro.set_global_pos(get_global_pos())
			# VICULA ELE NO MAIN
			get_parent().add_child(tiro)
			ultimo_disparo = intervalo
		pass
		
	if ultimo_disparo > 0:
		ultimo_disparo -= delta;
	
	pass


