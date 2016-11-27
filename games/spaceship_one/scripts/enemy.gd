extends Node2D

var vel = 280
var arma
var tiro_forte = preload("res://scripts/classes/armas/tiro_forte.gd")
var tiro_rapido = preload("res://scripts/classes/armas/tiro_rapido.gd")
var tiro_duplo = preload("res://scripts/classes/armas/tiro_duplo.gd")

var armas = [
	tiro_forte.new(self),
	tiro_rapido.new(self),
	tiro_duplo.new(self)
]

func _ready():
	self.add_to_group(game.GRUPO_INIMIGO)
	set_arma(0)
	set_process(true)
	pass
	
func _process(delta):
	
	arma.atualizar(delta)
	
	# SE PRESSIONAR O BOTÃO DE DISPARO
	arma.disparar()
	
	pass
	
	
func set_arma(valor):
	arma = armas[valor]
	pass