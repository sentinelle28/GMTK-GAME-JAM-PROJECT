extends Activable_Cell

func _on_body_entered(body)->void:
	if body is Player :
		if not body.is_growing:
			is_colliding = true
			get_parent()._change_value(1)
