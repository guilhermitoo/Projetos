# CLASSE POWER UP TIRO DUPLO

var meteoro
var pre_pu

func _init(meteoro): # CONSTRUTOR DA CLASSE
	self.meteoro = meteoro
	pass
	
func resultar_powerup(velocidade):
	# gera um número aleatório de 0 a 1
	# se estiver dentro da chance de bonus então
	# gera o bonus
	randomize()
	var aleatoriedade = rand_range(0,100)
	
	if game.chance_bonus > aleatoriedade:
		# INSTANCIA O POWERUP A PARTIR DO PRE_PU
		var powerup = pre_pu.instance()
		powerup.vel = velocidade
		# DEFINE A POSIÇÃO DELE NA POSIÇÃO DO METEORO
		powerup.set_global_pos(meteoro.get_global_pos())
		# VINCULA ELE NO MAIN
		game.getMain().add_child(powerup)
	pass
	