extends Area2D

var vel = 0
var vel_ini = 75
var vel_fim = 150
var rotation = 0
var rot_ini = -3
var rot_fim = 3
var vida = 7

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
	pass

func _process(delta):
	# DESCE
	set_pos(get_pos() + Vector2(0,1) * vel * delta)
	
	rotate(rotation * delta)
	pass
	
func aplica_dano(valor):
	vida -= valor
	get_node("anim").play("hit")
	if vida <= 0:
		set_z(10)
		remove_from_group(game.GRUPO_INIMIGO)
		get_node("anim").play("destroy")
		set_process(false)
	pass