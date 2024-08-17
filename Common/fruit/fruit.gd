extends PushableEntities

@export var New_scale:float = 1
@export var tilemap:TileMap
@onready var Point:Node2D = get_node("Node2D")

func _push(body:CharacterBody2D,direction):
	if body is Player:
		
		body._update_scale(New_scale)
		body._move_towards(direction)
		body.global_position = Point.global_position
		queue_free()
	else:
		if _check_move(direction):
			_move_towards(direction)
			body._move_towards(direction)
		
