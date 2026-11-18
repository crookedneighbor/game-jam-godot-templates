@abstract
class_name State extends Node

var actor: Node2D

func init(_actor: Node2D) -> void:
	actor = _actor

func process(_delta: float) -> void:
	pass

func physics_process(_delta: float) -> void:
	pass

func enter(_prev_state: String) -> void:
	pass

func exit() -> void:
	pass
