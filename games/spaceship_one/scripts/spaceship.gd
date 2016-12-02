
extends Node2D

var vel = 0
var arma
var tiro_simples = preload("res://scripts/classes/armas/tiro_simples.gd")
var tiro_rapido = preload("res://scripts/classes/armas/tiro_rapido.gd")
var tiro_duplo = preload("res://scripts/classes/armas/tiro_duplo.gd")

var armas = [
	tiro_simples.new(self),
	tiro_rapido.new(self),
	tiro_duplo.new(self)
]


func _ready():
	self.add_to_group(game.GRUPO_NAVE)
	set_arma(0)
	set_process(true)
	game.connect("lifes_changed",self,"_on_lifes_changed")
	vel = game.nave_velocidade
	pass
	
func _process(delta):
	
	# função criada apenas para separar o código de controle de direção da nave
	ControlarDirecao(delta)
	
	arma.atualizar(delta)
	
	# SE PRESSIONAR O BOTÃO DE DISPARO
	if Input.is_action_pressed("ui_action"):
		arma.disparar()
		# Reduz 1 de munição por tiro qnd for bonus
		if arma.municao < 0:
			set_arma(0)
			
		pass
		
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
	if get_pos().x > (OS.get_window_size().x - game.margem_acrescida_tela):
		right = 0
	if get_pos().x < (game.margem_acrescida_tela):
		left = 0
	
	# DIREÇÃO DIREITA E ESQUERDA
	set_pos(get_pos() + Vector2(1, 0) * vel * delta * (right + left))
		
	pass
	
func set_arma(valor):
	arma = armas[valor]
	if valor > 0:
		arma.setMunicao(game.shoot_municao_padrao)
	pass

func _on_spaceship_area_enter( area ):
	if area.is_in_group(game.GRUPO_INIMIGO):
		# SE tem o metodo aplica dano
		if area.has_method("aplica_dano"):
			# ENTAO destroy o objeto, pois colidiu com a nave
			area.aplica_dano(200,area)
			self.aplica_dano(1,null)
	
func _on_lifes_changed():
	# Executa este código quando a vida muda
	
	# faz um cálculo para saber quantos % a vida atual corresponde a vida total
	var x = ((game.nave_vida * 100) / game.nave_hp)
	# faz a verificacao para mudar os frames da animação de destruição
	var y = 0
	if x < 20:
		y = 3
	elif x < 50:
		y = 2
	elif x < 80:
		y = 1
	else:
		y = 0
	get_node("damage").set_frame(y)
	pass 
	
func aplica_dano(valor,nave):
	if nave != self:
		game.nave_vida -= valor
		get_node("anim").play("hit")
		# executa a animação de balançar a câmera
		game.getCamera().shake()
	pass