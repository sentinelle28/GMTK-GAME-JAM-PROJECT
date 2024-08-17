extends ActivationManager

class_name Water

func _activate()->void:
	call_deferred("_other")
	

func _other()->void:
	get_tree().reload_current_scene()
