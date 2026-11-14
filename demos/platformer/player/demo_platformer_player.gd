extends PlatformerPlayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

var last_played_animation: String = ""

func play_animation(anim_name: String) -> void:
	# allow one shot animations like fall to not repeat
	if anim_name == last_played_animation:
		return

	last_played_animation = anim_name
	
	animation_player.play(anim_name)


func death() -> void:
	_update_state("death")
	velocity.y = -300.0
	velocity.x *= -0.25
	collision_shape.queue_free()
	await animation_player.animation_finished
	died.emit()
	
