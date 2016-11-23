extends Area2D

var vel
var vel_ini = 50
var vel_fim = 200
var rotation
var rot_ini = -3
var rot_fim = 3
var scale_ini = 0.5
var scale_fim = 1.5
var scale
var vida = 5

var pu_rapido = preload("res://scenes/powerup_tiro_rapido.tscn")
var pu_duplo = preload("res://scenes/powerup_tiro_duplo.tscn")

func _ready():
	# adiciona o meteoro criado ao grupo inimigos
	add_to_group(game.GRUPO_INIMIGO)
	# melhora o randomico, cria uma nova semente para tomar como
	# base no rand_rage
	randomize()
	set_process(true)
	# GERA UM NÚMERO ALEATÓRIO ENTRE -20 E 20 
	# PARA UTILIZAR NA FUNÇÃO DE ROTAÇÃO (ESQUERDA OU DIREITA ALEATORIO)
	
	rotation = rand_range(rot_ini,rot_fim)
	vel = rand_range(vel_ini,vel_fim)
	scale = rand_range(scale_ini,scale_fim)
	
	pass

func _process(delta):
	# DESCE
	set_pos(get_pos() + Vector2(0,1) * vel * delta)
	
	rotate(rotation * delta)
	
	set_scale(Vector2(scale,scale))
	pass
	
func aplica_dano(valor):
	vida -= valor
	get_node("anim").play("hit")
	if vida <= 0:
		game.score += game.pontuacao_por_meteoro
		set_z(10)
		remove_from_group(game.GRUPO_INIMIGO)
		get_node("anim").play("destroy")
		set_process(false)
		game.getCamera().shake()
		gerar_bonus()
		get_node("sample").play("explosion")
	pass
	
func gerar_bonus():
	# FUNCAO VAI GERAR UM BONUS A PARTIR DO METEORO
	pass