extends Area2D

var dano = 10
var creator setget setCreator

func _ready():
	pass

func setCreator(valor):
	creator = valor

func _on_u_lasercannon_area_enter( area ):
	if area.is_in_group(game.GRUPO_INIMIGO):
		if area.has_method("aplica_dano"):
			# ENTAO reduz 1 de vida
			area.aplica_dano(dano,creator)
	pass # replace with function body
