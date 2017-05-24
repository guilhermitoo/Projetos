extends Area2D

export var vida = 3
export var pontos = 10

func _ready():
	set_process(true)
	add_to_group(game.GRUPO_INIMIGO)	
	_inicia()
	pass

func aplica_dano(valor,nave):
	vida -= valor
	if vida <= 0:
		_destroi()
		# acresce PONTUACAO DO JOGO
		if nave.is_in_group(game.GRUPO_NAVE):
			game.score += game.pontuacao_por_meteoro
		# para o processamento
		set_process(false)
		set_z(10)
		# remove do grupo INIMIGO
		remove_from_group(game.GRUPO_INIMIGO)
		# executa a animação de balançar a câmera
		game.getCamera().shake()	
	pass
	
func _destroi():
	pass
	
func _inicia():
	pass
	pass