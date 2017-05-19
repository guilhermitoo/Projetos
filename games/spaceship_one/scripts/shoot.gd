extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"
var vel
var dano
var direction = -1
var creator setget setCreator #recebe a nave que criou o tiro
var wr

func _ready():
	vel = game.shoot_vel
	dano = game.shoot_dano
	set_process(true)
	get_node("sample").play("shoot")
	pass

func _process(delta):
	# fica verificando com uma referencia fraca se o objeto creator está atribuido
	wr = weakref(creator)
	set_pos(get_pos() + Vector2(0,direction) * vel * delta)
	
	if game.estaForaTela(self):
		print("shoot_free")
		queue_free()
	pass


func _on_shoot_area_enter( area ):
	# se tem referência, ou seja, se está atribuido, então executa
	if wr && wr.has_method("get_ref"):
		if wr.get_ref():
			
			var CriadorEhNave    = creator.is_in_group(game.GRUPO_NAVE)
			var CriadorEhInimigo = creator.is_in_group(game.GRUPO_INIMIGO)
			var AlvoEhNave       = area.is_in_group(game.GRUPO_NAVE)
			var AlvoEhInimigo    = area.is_in_group(game.GRUPO_INIMIGO)
			# se o alvo acertado é do grupo SHIELD, então tem escudo
			var AlvoTemEscudo    = area.is_in_group(game.GRUPO_SHIELD)
			
			if ( CriadorEhNave && AlvoEhInimigo ) or ( AlvoEhNave && CriadorEhInimigo ):
				if AlvoTemEscudo:
					# se for um tipo escudo então destroi o tiro
					queue_free()
					# SE tem o metodo aplica dano
				else:
					if area.has_method("aplica_dano"):
						# ENTAO reduz 1 de vida
						area.aplica_dano(dano,creator)
					else:
						# SENAO já libera o objeto
						area.queue_free()
					# Destrói o tiro
					queue_free()
				
	pass 

func setCreator(valor):
	creator = valor
	pass