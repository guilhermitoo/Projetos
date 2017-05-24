extends "res://scripts/class_enemy.gd"

var vel
var rotation
var scale

var pre_pu_duplo = preload("res://scripts/classes/bonus/class_pu_tiro_duplo.gd")
var pre_pu_rapido = preload("res://scripts/classes/bonus/class_pu_tiro_rapido.gd")
var pre_pu_basic_shield = preload("res://scripts/classes/bonus/class_pu_basic_shield.gd")

func _process(delta):
	# DESCE
	set_pos(get_pos() + Vector2(0,1) * vel * delta)
	
	rotate(deg2rad(rotation*delta))
	
	if game.estaForaTela(self):
		print("enemy_free")
		queue_free()
	pass
	
func gerar_pu():
	# INSTANCIA UM NOVO POWERUP
	var basic_shield = pre_pu_basic_shield.new(self)
	
	# verifica se existe algum bonus na tela, evitando vários bonus na tela
	if ! game.getMain().has_node("powerup_basic_shield"):
		basic_shield.resultar_powerup(vel*0.5)
	
	pass

func _destroi():
	# executa a animação de destruição
	get_node("anim").play("destroy")
	# GERA UM POWER UP AO DESTRUIR O METEORO
	#gerar_pu()
	# executa o som de destruição
	get_node("sample").play("explosion")
	pass
	
func _inicia():
	# melhora o randomico, cria uma nova semente para tomar como
	# base no rand_rage
	randomize()
	rotation = rand_range(game.meteor_rot_ini,game.meteor_rot_fim)
	vel = rand_range(game.meteor_vel_ini,game.meteor_vel_fim)
	scale = rand_range(game.meteor_scale_ini,game.meteor_scale_fim)
	vida = game.meteor_hp
	
	set_scale(Vector2(scale,scale))