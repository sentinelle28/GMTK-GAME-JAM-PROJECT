extends PushableEntities

@export var New_scale:float = 1
@export var is_inverted:bool = false
@onready var Point:Node2D = get_node("Node2D")
@onready var sprite:Sprite2D = get_node("Sprite2D")

func _ready()->void:
	if is_inverted:
		New_scale = 1/New_scale

func _push(body:CharacterBody2D,direction):
	if body is Player:
		$AudioStreamPlayer.play()
		body._update_scale(New_scale)
		body.global_position = Point.global_position
		
		queue_free()
	else:
		if _check_move(direction):
			_move_towards(direction)
			body._move_towards(direction)

func _process(_delta:float)->void:
	var shift:float = sin($Timer.time_left) * 10
	
	sprite.position =Vector2(0,shift)
