extends KinematicBody2D
const MAX_SPEED = 500
var acceleration = 25
var motion = Vector2()	
var counter 
var gravedad
var gravity = 100
func _physics_process(delta):
	var jump = -2000
	var friction = false

	
	
	motion.y = motion.y + gravity
	if Input.is_action_pressed("move_right"):
		motion.x = min(motion.x + acceleration, +MAX_SPEED)
	elif Input.is_action_pressed("move_left"):
		motion.x = max(motion.x-acceleration, -MAX_SPEED)
	else:
		friction = true
	if is_on_floor():
		counter = 1
		gravity = 100
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
		if Input.is_action_pressed("move_up") and counter == 1:
			motion.y =  jump
	if Input.is_action_just_released("move_up"):
		counter = 0
		gravity = 200
		
	motion = move_and_slide(motion, Vector2.UP)
	print(motion.x)
	print(motion.y)
	
func player_movement():
	pass
