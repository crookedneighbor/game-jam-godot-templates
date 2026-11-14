extends Node2D
@onready var player: PlatformerPlayer = $DemoPlatformerPlayer

func _ready() -> void:
	player.died.connect(_on_killed)

func _on_killed() -> void:
	GameManager.restart()
