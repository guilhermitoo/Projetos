extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"
var vel = 600

func _ready():
	set_process(true)
	pass

func _process(delta):
	set_pos(get_pos() + Vector2(0,-1) * vel * delta)
	
	if get_pos().y < - 30:
		free()
	
	pass


func _on_shoot_area_enter( area ):
	# SE area de colisão está no grupo_inimigo
	if area.is_in_group(game.GRUPO_INIMIGO):
		# SE tem o metodo aplica dano
		if area.has_method("aplica_dano"):
			# ENTAO reduz 1 de vida
			area.aplica_dano(1)
		else:
			# SENAO já libera o objeto
			area.queue_free()
			
		# Destrói o tiro
		queue_free()
	pass # replace with function body
