extends ActivationManager

@export var door:StaticBody2D
var number_of_box:int = 0
func _activate()->void:
	if door != null:
		door.get_node("animator").play("Open")
		for child:Activable_Cell in get_children():
			child._change()
		await get_tree().create_timer(1).timeout
		door.queue_free()

func _can_activate()->bool:
	return value == get_child_count()

func _process(_delta:float)->void:
	if not player.is_static and value != number_of_box:
		value = number_of_box
