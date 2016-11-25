# CLASSE TIRO DUPLO

var intervalo = 0.2
var ultimo_disparo = 0
var nave
var pre_tiro
var municao = 20

func _init(nave): # CONSTRUTOR DA CLASSE
	self.nave = nave
	pass
	

func criar_tiro(node):
	# INSTANCIA O TIRO A PARTIR DO PRE_TIRO
	var tiro = pre_tiro.instance()
	# DEFINE A POSIÇÃO DELE NA POSIÇÃO DA NAVE
	tiro.set_global_pos(node.get_global_pos())
	# VICULA ELE NO MAIN
	nave.get_owner().add_child(tiro)
	
	municao -= 1
	
	pass

func atualizar(delta):
	if ultimo_disparo > 0:
		ultimo_disparo -= delta
	pass