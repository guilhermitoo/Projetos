extends Area2D

var vel = 100
var arma = 0

func _ready():
	set_process(true)
	pass
	
func _process(delta):
	# DESCE
	set_global_pos(get_global_pos() + Vector2(0,1) * vel * delta)
	
	if game.estaForaTela(self):
		print("powerup_free")
		queue_free()
	pass
	
func _on_powerup_tiro_duplo_area_enter( area ):
	# area é a NAVE
	# Os métodos invocados estão em SPACESHIP.GD
	if area.is_in_group(game.GRUPO_NAVE):
		area.set_arma(arma)
		queue_free()
	pass # replace with function body