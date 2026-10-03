extends PlatformerPlayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func play_animation(anim_name: String) -> void:
	animation_player.play(anim_name)
