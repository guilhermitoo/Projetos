extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var mousepos = Vector2(0,0)

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	#mousepos = game.getCamera().get_global_mouse_pos()
	pass

func _process(delta):
	if mousepos != Vector2(0,0):
		var a = mousepos*delta
		translate(a)
