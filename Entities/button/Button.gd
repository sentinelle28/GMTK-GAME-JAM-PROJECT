extends ActivationManager

@export var door:StaticBody2D
func _activate()->void:
	door.get_node("animator").play("Open")
	await get_tree().create_timer(1).timeout
	door.queue_free()

func _can_activate()->bool:
	return value == get_child_count()
