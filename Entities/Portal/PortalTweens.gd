extends Area2D

class_name PortalTweens
@export var ScaleToApply:int = 1
@export var TweenOfThePortal:PortalTweens
@export var direction:Vector2i
@onready var NewCoords:Vector2 = get_node("CollisionShape2D").global_position
