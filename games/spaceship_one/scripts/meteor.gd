extends Area2D

var vel
var rotation
var scale
var vida

var pre_pu_duplo = preload("res://scripts/classes/bonus/class_pu_tiro_duplo.gd")
var pre_pu_rapido = preload("res://scripts/classes/bonus/class_pu_tiro_rapido.gd")
var pre_pu_basic_shield = preload("res://scripts/classes/bonus/class_pu_basic_shield.gd")

func _ready():
	# adiciona o meteoro criado ao grupo inimigos
	add_to_group(game.GRUPO_INIMIGO)
	# melhora o randomico, cria uma nova semente para tomar como
	# base no rand_rage
	randomize()
	set_process(true)
	# GERA UM NÚMERO ALEATÓRIO ENTRE -20 E 20 
	# PARA UTILIZAR NA FUNÇÃO DE ROTAÇÃO (ESQUERDA OU DIREITA ALEATORIO)
	
	rotation = rand_range(game.meteor_rot_ini,game.meteor_rot_fim)
	vel = rand_range(game.meteor_vel_ini,game.meteor_vel_fim)
	scale = rand_range(game.meteor_scale_ini,game.meteor_scale_fim)
	vida = game.meteor_hp
	
	set_scale(Vector2(scale,scale))
	pass

func _process(delta):
	# DESCE
	set_pos(get_pos() + Vector2(0,1) * vel * delta)
	
	rotate(rotation * delta)
	
	if game.estaForaTela(self):
		print("meteor_free")
		queue_free()
	
	pass
	
func aplica_dano(valor,nave):
	vida -= valor
	get_node("anim").play("hit")
	if vida <= 0:
		# acresce PONTUACAO DO JOGO
		if nave.is_in_group(game.GRUPO_NAVE):
			game.score += game.pontuacao_por_meteoro
		set_z(10)
		# remove do grupo INIMIGO
		remove_from_group(game.GRUPO_INIMIGO)
		# executa a animação de destruição
		get_node("anim").play("destroy")
		# para o processamento
		set_process(false)
		# executa a animação de balançar a câmera
		game.getCamera().shake()
		# GERA UM POWER UP AO DESTRUIR O METEORO
		#gerar_pu()
		# executa o som de destruição
		get_node("sample").play("explosion")
	pass
	
func gerar_pu():
	# INSTANCIA UM NOVO POWERUP
	var basic_shield = pre_pu_basic_shield.new(self)
	
	# verifica se existe algum bonus na tela, evitando vários bonus na tela
	if ! game.getMain().has_node("powerup_basic_shield"):
		basic_shield.resultar_powerup(vel*0.5)
	
	pass