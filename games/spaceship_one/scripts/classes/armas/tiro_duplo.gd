# CLASSE TIRO DUPLO

var intervalo = 0.2
var ultimo_disparo = 0
var nave
var pre_tiro = preload("res://scenes/tiro_verde.tscn")

func _init(nave): # CONSTRUTOR DA CLASSE tiro_simples
	self.nave = nave
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

func criar_tiro(node):
	# INSTANCIA O TIRO A PARTIR DO PRE_TIRO
	var tiro = pre_tiro.instance()
	# DEFINE A POSIÇÃO DELE NA POSIÇÃO DA NAVE
	tiro.set_global_pos(node.get_global_pos())
	# VICULA ELE NO MAIN
	nave.get_owner().add_child(tiro)
	pass

func atualizar(delta):
	if ultimo_disparo > 0:
		ultimo_disparo -= delta
	pass