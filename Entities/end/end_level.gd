extends Area2D

@export var level_to_unlock:int = 1
@export var point_to_go:Node2D
@export var camera:Camera2D


func _on_body_entered(body)->void:
	if body is Player:
		LevelUnlock._set_last_level(level_to_unlock)
		$AudioStreamPlayer.play()
		var tween:Tween = get_tree().create_tween()
		var tween_2:Tween = get_tree().create_tween()
		tween_2.tween_property(body,"rotation",360,1)
		tween_2.tween_property(body,"rotation",0,1)
		tween.tween_property(body,"global_position",point_to_go.global_position,1)
		tween.tween_property(camera,"global_position",(point_to_go.global_position+global_position)/2,0.5)
		
		
		
		await get_tree().create_timer(1/9).timeout
		
		
		
		SceneTransition._change_scene("res://Scene/GameplayScene/gameplay_scene.tscn")
