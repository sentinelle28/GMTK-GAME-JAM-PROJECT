extends ActivationManager

@export var door:StaticBody2D
func _activate()->void:
	door.queue_free()

func _can_activate()->bool:
	return value == get_child_count()
