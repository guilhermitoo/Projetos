extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"
var vel
var dano
var direction = -1

func _ready():
	vel = game.shoot_vel
	dano = game.shoot_dano
	set_process(true)
	get_node("sample").play("shoot")
	pass

func _process(delta):
	set_pos(get_pos() + Vector2(0,direction) * vel * delta)
	
	if game.estaForaTela(self):
		print("shoot_free")
		queue_free()
	pass


func _on_shoot_area_enter( area ):
	# SE area de colisão está no grupo_inimigo
	if area.is_in_group(game.GRUPO_INIMIGO) or area.is_in_group(game.GRUPO_NAVE):
		# SE tem o metodo aplica dano
		if area.has_method("aplica_dano"):
			# ENTAO reduz 1 de vida
			area.aplica_dano(dano)
		else:
			# SENAO já libera o objeto
			area.queue_free()
			
		# Destrói o tiro
		queue_free()
	pass 
