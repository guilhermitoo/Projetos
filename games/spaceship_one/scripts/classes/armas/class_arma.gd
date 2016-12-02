# CLASSE TIRO DUPLO

var intervalo = 0.17
var ultimo_disparo = 0
var nave
var pre_tiro
var municao = 0 setget setMunicao, getMunicao

signal gastou_municao

func _init(nave): # CONSTRUTOR DA CLASSE
	self.nave = nave
	pass
	
func setMunicao(valor):
	municao = valor
	emit_signal("gastou_municao")
	pass
	
func getMunicao():
	return municao
	pass

func criar_tiro(node):
	# INSTANCIA O TIRO A PARTIR DO PRE_TIRO
	var tiro = pre_tiro.instance()
	# DEFINE A POSIÇÃO DELE NA POSIÇÃO DA NAVE
	tiro.set_global_pos(node.get_global_pos())
	# VICULA ELE NO MAIN
	nave.get_owner().add_child(tiro)
	# atribui a nave como criador dele
	tiro.setCreator(nave)
	
	setMunicao(getMunicao() - 1)
	
	pass

func atualizar(delta):
	if ultimo_disparo > 0:
		ultimo_disparo -= delta
	pass