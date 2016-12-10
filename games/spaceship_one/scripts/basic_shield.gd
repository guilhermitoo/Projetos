extends Area2D

var vida_escudo = 5

func _ready():
	self.add_to_group(game.GRUPO_SHIELD)
	set_process(true)
	pass
	
func _process(delta):
	if vida_escudo <= 0:
		queue_free()
	pass
	
func _on_basic_shield_area_enter( area ):
	if area.is_in_group(game.GRUPO_INIMIGO):
		vida_escudo -= 1
		get_node("sample").play("hit1")
		get_node("anim").play("shield_hit")
		# SE tem o metodo aplica dano
		if area.has_method("aplica_dano"):
			# ENTAO destroy o objeto, pois colidiu com o escudo
			area.aplica_dano(200,area)
	pass # replace with function body
