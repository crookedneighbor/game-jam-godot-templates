extends CharacterBody2D

const SPEED: float = 300.0
const STOP_FRICTION: float = 10.0
const JUMP_VELOCITY: float = -400.0

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D

var last_direction := 0.0

func _ready() -> void:
	if !animation_player:
		print("Missing animation player :(")

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

func _handle_jump(_delta: float) -> void:
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

func _handle_movement(delta: float) -> void:
	var direction := Input.get_axis("left", "right")
	if direction:
		last_direction = direction
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0.0, STOP_FRICTION)
	
func _update_animation(_delta: float) -> void:
	sprite.flip_h = last_direction == -1.0

	if velocity.x != 0:
		animation_player.play("walk")
	else:
		animation_player.play("idle")
	
