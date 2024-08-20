extends CanvasLayer



func _on_retry_pressed()->void:
	hide()
	get_tree().reload_current_scene()
	get_tree().paused = false



func _on_continue_pressed()->void:
	hide()
	get_tree().paused = false


func _on_home_pressed()->void:
	hide()
	get_tree().paused = false
	SceneTransition._change_scene("res://Scene/GameplayScene/gameplay_scene.tscn")

func _process(_delta:float)->void:
	if Input.is_action_just_pressed("quit"):
		hide()
		get_tree().paused = false
