extends PushableEntities

@export var decoyre:PackedScene
func _on_area_2d_area_entered(area)->void:
	if area is Activable_Cell:
		if area.get_parent() is Water:
			var decoy:Sprite2D = decoyre.instantiate()
			decoy.global_position = global_position
			get_tree().current_scene.add_child(decoy)
			
			if area.is_colliding:
				area.get_parent()._change_value(-1)
			area.queue_free()
			queue_free()

func _push(body:CharacterBody2D,direction):
	if _check_move(direction):
		_move_towards(direction)
		body._move_towards(direction)
		$AudioStreamPlayer.play()
