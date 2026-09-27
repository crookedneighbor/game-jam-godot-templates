extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D

var last_direction := 0

func _ready() -> void:
	if !animation_player:
		print("Missing animation player :(")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		last_direction = direction
		velocity.x = direction * SPEED
		animation_player.play("walk")
	else:
		animation_player.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	sprite.flip_h = direction == -1.0

	move_and_slide()
