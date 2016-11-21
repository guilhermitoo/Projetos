
extends Node2D

var vel = 350
var arma

func _ready():
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
	
# CLASSE TIRO SIMPLES
class tiro_simples:
	var intervalo = 0.1
	var ultimo_disparo = 0
	var disparo_anterior
	var nave
	var pre_tiro = preload("res://scenes/shoot.tscn")
	
	func _init(nave): # CONSTRUTOR DA CLASSE tiro_simples
		self.nave = nave
		pass
		
	func disparar():
		if ultimo_disparo <= 0:
			# verifica qual o disparo anterior para intercalar
			if disparo_anterior == nave.get_node("position_cannon_left"):
				criar_tiro(nave.get_node("position_cannon_right"))
			else:
				criar_tiro(nave.get_node("position_cannon_left"))
			ultimo_disparo = intervalo
			pass
		pass
	
	func criar_tiro(node):
		# disparo_anterior recebe o node do disparo
		disparo_anterior = node
		# INSTANCIA O TIRO A PARTIR DO PRE_TIRO
		var tiro = pre_tiro.instance()
		# DEFINE A POSIÇÃO DELE NA POSIÇÃO DA NAVE
		tiro.set_global_pos(node.get_global_pos())
		# VICULA ELE NO MAIN
		nave.get_owner().add_child(tiro)
		pass
	
	func atualizar(delta):
		if ultimo_disparo > 0:
			ultimo_disparo -= delta
		pass