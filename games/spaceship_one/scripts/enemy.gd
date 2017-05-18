extends Node2D

var vel = 280
var arma
var tiro_forte = preload("res://scripts/classes/armas/tiro_forte.gd")
var tiro_rapido = preload("res://scripts/classes/armas/tiro_rapido.gd")
var tiro_duplo = preload("res://scripts/classes/armas/tiro_duplo.gd")
var pre_tiro = preload("res://scenes/inimigo_tiro.tscn");

var armas = [
	tiro_forte.new(self),
	tiro_rapido.new(self),
	tiro_duplo.new(self)
]

func _ready():
	# CARREGA TEXTURA ALEATÓRIA
	# get_node("enemy").set_texture(resources.random_ini_text())

	self.add_to_group(game.GRUPO_INIMIGO)
	set_arma(0)
	set_process(true)
	pass
	
func _process(delta):
	
	arma.atualizar(delta)
	
	# arma.disparar()
	
	pass
	
func set_arma(valor):
	arma = armas[valor]
	pass
	

func _on_tiro_timer_timeout():
	var tiro = pre_tiro.instance()
	tiro.set_global_pos(get_node("position_cannon_center").get_global_pos())
	game.getCamera().add_child(tiro)
	
