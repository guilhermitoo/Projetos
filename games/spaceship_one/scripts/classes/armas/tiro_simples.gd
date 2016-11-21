# CLASSE TIRO SIMPLES

var intervalo = 0.30
var ultimo_disparo = 0
var disparo_anterior
var nave
var pre_tiro = preload("res://scenes/shoot.tscn")

func _init(nave): # CONSTRUTOR DA CLASSE tiro_simples
	self.nave = nave
	pass
	
func disparar():
	if ultimo_disparo <= 0:
		# verifica qual o disparo anterior para intercalar
		
		criar_tiro(nave.get_node("position_cannon_center"))
		
		ultimo_disparo = intervalo
		pass
	pass

func criar_tiro(node):
	# disparo_anterior recebe o node do disparo
	disparo_anterior = node
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