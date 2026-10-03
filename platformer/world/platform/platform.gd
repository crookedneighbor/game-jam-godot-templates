@tool
class_name ExtendablePlatform extends AnimatableBody2D
@onready var left_side: Sprite2D = $LeftSide
@onready var middle: TextureRect = $Middle
@onready var right_side: Sprite2D = $RightSide
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

@export_range(1, 50) var middle_size: int = 1 :
	set(val):
		middle_size = val
		_update_visuals()

func _ready() -> void:
	_update_visuals()

func _update_visuals() -> void:
	if !middle or !left_side or !right_side or !collision_shape:
		return

	var full_size :=  16 * middle_size
	left_side.position.x = -1 * full_size / 2 - 8
	right_side.position.x = full_size / 2 + 8
	middle.position.x = -8 * middle_size
	middle.size.x = full_size
	collision_shape.shape.size.x = full_size + 32
	#print(collision_shape.shape.extents.x)
