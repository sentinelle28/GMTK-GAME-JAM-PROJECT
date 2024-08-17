@tool
extends Node2D

@export_category("portal scale")
@export var EnterScale:int = 1
@export var ExistScale:int = 1

@export_category("direction")
@export var DirectionOfEnter:Vector2i = Vector2i(0,-1)
@export var DirectionOfExit:Vector2i = Vector2i(0,1)



func _process(_delta)->void:
	_change_value()

func _change_value()->void:
	$Enter.ScaleToApply = EnterScale
	$Enter.direction = DirectionOfEnter
	$Enter.scale.x = EnterScale 
	$Enter.scale.y = EnterScale 
	
	
	$Exist.ScaleToApply = ExistScale
	$Exist.direction = DirectionOfExit
	if DirectionOfExit == Vector2i(0,1):
		$Exist.scale.x = ExistScale
	else:
		$Exist.scale.y = ExistScale
