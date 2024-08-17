extends CharacterBody2D
class_name Player
@export var tilemap:TileMap

var LastArea:PortalTweens

func _physics_process(_delta:float)->void:
	
	_move()
	move_and_slide()

func _move()->void:
	var direction:Vector2i = InputManager._get_vector(["ui_left","ui_right","ui_up","ui_down"])
	#make sure there is no diagonal
	if abs(direction.x) + abs(direction.y) != 2:
		velocity = direction*16
		#calculate new pos
		var new_pos:Vector2i = tilemap.local_to_map(global_position) + direction
		#if you area in a portal area
		if LastArea == null:
			#verify it's not a wall
			if _check_move(direction):
				#update pos
				global_position = tilemap.map_to_local(new_pos)
		else:
			if LastArea.direction == direction:
				global_position = tilemap.map_to_local(new_pos)
			else:
				if _check_move(direction):
					#update pos
					global_position = tilemap.map_to_local(new_pos)
			
		
func _update_scale(area:PortalTweens)->void:
	var new_scale:int = area.TweenOfThePortal.ScaleToApply/area.ScaleToApply
	if scale.x*new_scale >= 1 and scale.x < new_scale:
		scale.x *= new_scale
		scale.y *= new_scale
	else:
		scale.x = 1
		scale.y = 1
	global_position = area.TweenOfThePortal.NewCoords

func _on_area_2d_area_entered(area:PortalTweens)->void:
	var on_cooldown:bool = false
	if LastArea == area.TweenOfThePortal:
		_update_scale(LastArea)
		LastArea = null
		on_cooldown = true
	elif LastArea == null and area != null and not on_cooldown:
		LastArea = area
	elif LastArea != area.TweenOfThePortal:
		LastArea = area

func _check_move(direction:Vector2i)->bool:
	var collid_info:KinematicCollision2D = move_and_collide(direction*tilemap.tile_set.tile_size*0.16,true)
	if collid_info != null:
		return false
	else:
		return true

