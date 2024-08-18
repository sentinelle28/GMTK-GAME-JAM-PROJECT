extends CharacterBody2D

class_name PushableEntities
@export var Size:Vector2i = Vector2(64,64)
@onready var player:Player = get_node("../Player")

func _move_towards(direction:Vector2)->void:
	var collid:KinematicCollision2D = move_and_collide(direction * scale.x,true)
	
	if collid != null:
		if collid.get_collider() is PushableEntities:
			collid.get_collider()._push(direction)
	player.CollisionArray.append(self)

func _push(direction:Vector2)->void:
	_move_towards(direction)

func _check_collision(direction:Vector2)->bool:
	var collid:KinematicCollision2D = move_and_collide(direction * scale.x,true)
	if collid!=null:
		return false
	else:
		return true
