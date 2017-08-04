extends RigidBody2D

var walk_up = false
var walk_down = false
var walk_left = false
var walk_right = false
var walk_speed = 300
var walk_force = 1.5
var walk_step_size = 20
var walking_wait = 0
var walking_wait_default = 50
var move_scaled = true

func _ready():
	set_process(true)
	pass

func _process(delta):
	# para testes
	walk_up = Input.is_action_pressed("ui_up")
	
	walk_down = Input.is_action_pressed("ui_down")
	walk_right = Input.is_action_pressed("ui_right")
	walk_left = Input.is_action_pressed("ui_left")
	
	var pressing = walk_down or walk_up or walk_left or walk_right
	Move(pressing);
	
	
func Move(pressing):
	if ! pressing:
		walking_wait = 0
	if (walking_wait < 0):
		walking_wait = walking_wait_default
		if walk_down:
			move_local_y(walk_step_size,move_scaled)
		elif walk_right:
			move_local_x(walk_step_size,move_scaled)
		elif walk_left:
			move_local_x(-walk_step_size,move_scaled)
		elif walk_up:
			move_local_y(-walk_step_size,move_scaled)
	else:
		walking_wait -= 0.1
		