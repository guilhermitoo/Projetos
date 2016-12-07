extends Path2D

onready var follow = get_node("follow")


func _ready():
	set_curve(resources.random_path())
	set_process(true)
	pass
	
	
func _process(delta):
	follow.set_offset(follow.get_offset() + game.nave_enemy_vel * delta)
	
	if follow.get_unit_offset() > 1:
		queue_free()