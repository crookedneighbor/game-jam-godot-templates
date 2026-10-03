class_name PlatformerPlayer extends CharacterBody2D

const SPEED: float = 300.0
const ACCELERATION_FRICTION: float = 10.0
const STOP_FRICTION: float = 20.0
const JUMP_VELOCITY: float = -400.0

@onready var sprite: Sprite2D = $Sprite2D

var last_direction := 0.0
var current_state := "idle"

func _physics_process(delta: float) -> void:
	_apply_gravity(delta)
	_handle_jump(delta)
	_handle_movement(delta)
	_update_animation(delta)

	move_and_slide()

func _apply_gravity(delta: float) -> void:
	if is_on_floor():
		return

	velocity += get_gravity() * delta
	if velocity.y > 0: _update_state("fall")

func _handle_jump(_delta: float) -> void:
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		_update_state("jump")

func _handle_movement(_delta: float) -> void:
	var direction := Input.get_axis("left", "right")
	if direction:
		last_direction = direction
		velocity.x = move_toward(velocity.x, direction * SPEED, ACCELERATION_FRICTION)
	else:
		velocity.x = move_toward(velocity.x, 0.0, STOP_FRICTION)
	
	if is_on_floor() and current_state != "jump": 
		if direction: _update_state("walk")
		elif velocity.x == 0 or current_state == "fall": _update_state("idle")
	
func _update_animation(_delta: float) -> void:
	sprite.flip_h = last_direction == -1.0
	play_animation(current_state)

func _update_state(new_state: String) -> void:
	if new_state == current_state:
		return
	
	current_state = new_state

func play_animation(_name: String) -> void:
	pass
