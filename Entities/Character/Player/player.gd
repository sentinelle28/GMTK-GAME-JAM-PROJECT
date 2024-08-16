extends CharacterBody2D
@export var tilemap:TileMap


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
		#verify it's not a wall
		if tilemap.get_cell_atlas_coords(1,new_pos) == Vector2i(-1,-1):
			#update pos
			global_position = tilemap.map_to_local(new_pos)
			
