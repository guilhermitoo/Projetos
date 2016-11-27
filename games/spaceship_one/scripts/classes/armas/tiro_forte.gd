extends "res://scripts/classes/armas/class_arma.gd"
# CLASSE TIRO DUPLO

func _init(x).(x): # CONSTRUTOR DA CLASSE
	._init(x)
	pre_tiro = preload("res://scenes/tiro_vermelho_large.tscn")
	pass
	
func disparar():
	if ultimo_disparo <= 0:
		
		criar_tiro(nave.get_node("position_cannon_center"))
		
		ultimo_disparo = intervalo
		pass
	pass