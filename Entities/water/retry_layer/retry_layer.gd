extends CanvasLayer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta)->void:
	if Input.is_action_just_pressed("retry"):
		get_tree().reload_current_scene()
