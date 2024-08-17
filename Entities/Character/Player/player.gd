extends CharacterBody2D
class_name Player
@export var Size:Vector2i = Vector2i(64,64)


func _physics_process(_delta:float)->void:
	""" Main function"""
	
	_move()
	move_and_slide()

func _move()->void:
	
	""" Handle mouvement"""
	#get direction if has permission
	var direction:Vector2i = InputManager._get_vector(["ui_left","ui_right","ui_up","ui_down"])
	#make sure there is no diagonal
	if abs(direction.x) + abs(direction.y) != 2:
		#calculate new pos
		
		if direction != Vector2i.ZERO:
			$AnimationTree["parameters/blend_position"] = Vector2(direction)
			
		#verify it's not a wall
		if _check_move(direction):
			#update pos
			_move_towards(direction)
		
			
		
func _update_scale(Scale:float)->void:
	var new_scale:int = Scale
	if scale.x*new_scale >= 1:
		scale.x *= new_scale
		scale.y *= new_scale
	elif scale.x * new_scale < 1:
		scale.x = 1
		scale.y = 1


func _check_move(direction:Vector2i)->bool:
	
	var collid_info:KinematicCollision2D = move_and_collide(direction*Size,true)
	if collid_info != null:
		return false
	else:
		return true

func _move_towards(direction:Vector2)->void:
	global_position += direction*Vector2(Size)
