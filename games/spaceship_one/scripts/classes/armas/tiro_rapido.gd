extends "res://scripts/classes/armas/class_arma.gd"

func _init(x).(x): # CONSTRUTOR DA CLASSE
	._init(x)
	pre_tiro = preload("res://scenes/tiro_vermelho.tscn")
	intervalo = 0.08
	pass
	
func disparar():
	if ultimo_disparo <= 0:
		# verifica qual o disparo anterior para intercalar
		
		criar_tiro(nave.get_node("position_cannon_center"))
		
		ultimo_disparo = intervalo
		pass
	pass