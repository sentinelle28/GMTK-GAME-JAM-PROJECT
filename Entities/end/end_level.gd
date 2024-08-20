extends Area2D

@export var level_to_unlock:int = 1



func _on_body_entered(body)->void:
	if body is Player:
		LevelUnlock._set_last_level(level_to_unlock)
		SceneTransition._change_scene("res://Scene/GameplayScene/gameplay_scene.tscn")
