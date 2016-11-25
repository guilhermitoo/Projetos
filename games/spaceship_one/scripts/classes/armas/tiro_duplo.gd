extends "res://scripts/classes/armas/class_arma.gd"
# CLASSE TIRO DUPLO

func _init(x).(x): # CONSTRUTOR DA CLASSE
	._init(x)
	pre_tiro = preload("res://scenes/tiro_verde.tscn")
	pass
	
func disparar():
	if ultimo_disparo <= 0:
		
		criar_tiro(nave.get_node("position_cannon_right"))
		criar_tiro(nave.get_node("position_cannon_left"))
		
		# verifica qual o disparo anterior para intercalar
		#if disparo_anterior == nave.get_node("position_cannon_left"):
		#	criar_tiro(nave.get_node("position_cannon_right"))
		#else:
		#	criar_tiro(nave.get_node("position_cannon_left"))
		
		ultimo_disparo = intervalo
		pass
	pass