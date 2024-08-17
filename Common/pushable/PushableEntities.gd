extends CharacterBody2D

class_name PushableEntities
@export var Size:Vector2i = Vector2(64,64)

func _check_move(direction:Vector2i)->bool:
	var collid_info:KinematicCollision2D = move_and_collide(direction*Size,true)
	if collid_info != null:
		if collid_info.get_collider() is PushableEntities:
			collid_info.get_collider()._push(self,direction)
		return false
	else:
		return true

func _move_towards(direction:Vector2)->void:
	global_position += direction*Vector2(Size)

func _push(body:CharacterBody2D,direction):
	if _check_move(direction):
		_move_towards(direction)
		body._move_towards(direction)
