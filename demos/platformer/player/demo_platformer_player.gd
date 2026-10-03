extends PlatformerPlayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func play_animation(name: String) -> void:
	animation_player.play(name)
