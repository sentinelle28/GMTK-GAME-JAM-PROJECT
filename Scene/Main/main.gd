extends Node2D

func _ready()->void:
	MainMusic._play()


func _on_play_pressed()->void:
	$AudioStreamPlayer.play()
	SceneTransition._change_scene("res://Scene/GameplayScene/gameplay_scene.tscn")

