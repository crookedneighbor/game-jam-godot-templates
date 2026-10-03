extends Area2D

signal killed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_player_enter)

func _on_player_enter(_body: Node2D) -> void:
	killed.emit()
