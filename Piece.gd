extends RigidBody2D
var impulse_vector = Vector2(0, 100)

func _ready():
	contact_monitor = true

func _input(_event):
	#"Wakes" the object from sleep upon detecting an input
	#This does create a bug where pressing a button other than the arrow keys wakes it from sleep
	#But for this project that is okay, just something to keep in mind...
	sleeping = false

func _integrate_forces(state):
	var mouse_pos = get_viewport().get_mouse_position()
	var direction = mouse_pos - position
	var angle_to = -transform.y.angle_to(direction)
	state.apply_torque_impulse(500 * sign(angle_to) * min(PI, abs(angle_to)))
	state.apply_central_impulse(-impulse_vector.rotated(rotation))
	
	
#	if Input.is_action_pressed("ui_up"):
#		state.apply_central_impulse(-1 * impulse_vector.rotated(rotation))
#	if Input.is_action_pressed("ui_down"):
#		state.apply_central_impulse(impulse_vector.rotated(rotation))
#	if Input.is_action_pressed("ui_left"):
#		state.apply_torque_impulse(-500)
#	if Input.is_action_pressed("ui_right"):
#		state.apply_torque_impulse(500)

func _physics_process(delta):
	pass
