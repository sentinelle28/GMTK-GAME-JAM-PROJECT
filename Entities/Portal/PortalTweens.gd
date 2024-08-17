extends Area2D

class_name PortalTweens
@export var ScaleToApply:int = 1
@export var TweenOfThePortal:PortalTweens
@export var direction:Vector2i
@onready var NewCoords:Vector2 = get_node("CollisionShape2D").global_position

var is_colliding:bool = false

func _on_body_exited(_body:Player):
	is_colliding = false


func _on_body_entered(_body:Player):
	is_colliding = true

func _check_collision()->bool:
	return is_colliding and TweenOfThePortal.is_colliding
