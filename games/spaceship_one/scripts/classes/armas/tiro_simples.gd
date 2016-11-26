extends "res://scripts/classes/armas/class_arma.gd"

# CLASSE TIRO SIMPLES

func _init(x).(x): # CONSTRUTOR DA CLASSE
	._init(x)
	pre_tiro = preload("res://scenes/shoot.tscn")
	intervalo = 0.3
	pass
	
func disparar():
	if ultimo_disparo <= 0:
		# verifica qual o disparo anterior para intercalar
		
		criar_tiro(nave.get_node("position_cannon_center"))
		
		ultimo_disparo = intervalo
		pass
	pass