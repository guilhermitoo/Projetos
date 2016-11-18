extends Area2D

var vel = 0
var rotation = 0
var vida = 4

func _ready():
	# adiciona o meteoro criado ao grupo inimigos
	add_to_group(game.GRUPO_INIMIGO)
	# melhora o randomico, cria uma nova semente para tomar como
	# base no rand_rage
	randomize()
	set_process(true)
	# GERA UM NÚMERO ALEATÓRIO ENTRE -20 E 20 
	# PARA UTILIZAR NA FUNÇÃO DE ROTAÇÃO (ESQUERDA OU DIREITA ALEATORIO)
	rotation = rand_range(-3,3)
	vel = rand_range(200,350)
	pass

func _process(delta):
	# DESCE
	set_pos(get_pos() + Vector2(0,1) * vel * delta)
	
	rotate(rotation * delta)
	pass
	
func aplica_dano(valor):
	vida -= valor
	if vida <= 0:
		queue_free()
	pass