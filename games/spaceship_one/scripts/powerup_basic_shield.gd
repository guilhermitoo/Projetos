extends "res://scripts/powerup.gd"

var pre_shield = preload("res://scenes/basic_shield.tscn")

func _ready():
	get_node("anim").play("shine")
	set_process(true)
	pass
	
func _on_powerup_bonus_area_enter( area ):
	if area.is_in_group(game.GRUPO_NAVE):
		if area.shield == 0:
			var shield = pre_shield.instance()
			#shield.set_pos(area.get_pos());
			area.add_child(shield)
			area.setShield(1)
			print("shields_up")
		queue_free()
	pass