extends Node2D

class_name  ActivationManager
@onready var player:Player = get_node("../Player")
var value:int = 0

func _change_value(inc:int)->void:
	value += inc
	if _can_activate():
		_activate()
	
func _activate()->void:
	pass
func _can_activate()->bool:
	return value >= player.scale.x**2
