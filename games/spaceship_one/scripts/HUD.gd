extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process_input(true)
	pass
	

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		game.pausar()
		pass
	pass
