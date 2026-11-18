class_name NPC extends CharacterBody2D

@onready var state_machine: StateMachine = $StateMachine
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Direction/Sprite2D
@onready var direction_node: Node2D = $Direction
@onready var ground_detector: RayCast2D = $Direction/GroundDetector

var direction: int = -1


func _process(delta: float) -> void:
	state_machine.process(delta)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	state_machine.physics_process(delta)
	
	if -direction != direction_node.scale.x:
		# don't love that I have to set the velocity here, but it
		# fixes a bug where the velocity doesn't match
		velocity.x = 0
		direction_node.scale.x = -direction
	move_and_slide()

func change_state(state_name: String) -> void:
	state_machine.change_state(state_name)

func play_animation(anim_name: StringName) -> void:
	animation_player.play(anim_name)

func is_way_blocked() -> bool:
	ground_detector.force_raycast_update()
	return not ground_detector.is_colliding()
