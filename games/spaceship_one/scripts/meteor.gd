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

var pre_pu_duplo = preload("res://scripts/classes/bonus/class_pu_tiro_duplo.gd")

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
		# GERA UM POWER UP AO DESTRUIR O METEORO
		gerar_pu()
		get_node("sample").play("explosion")
	pass
	
func gerar_pu():
	# INSTANCIA UM NOVO POWERUP DE TIRO DUPLO
	var pu = pre_pu_duplo.new(self)
	pu.resultar_powerup(vel)
	pass