extends Node2D

func _on_killed() -> void:
	GameManager.restart()
