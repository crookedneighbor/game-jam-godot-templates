extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_player_enter)

func _on_player_enter(player: Node2D) -> void:
	if player.has_method("death"):
		player.death()
