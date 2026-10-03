extends PlatformerPlayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var last_played_animation: String = ""

func play_animation(anim_name: String) -> void:
	# allow one shot animations like fall to not repeat
	if anim_name == last_played_animation:
		return

	last_played_animation = anim_name
	
	animation_player.play(anim_name)
