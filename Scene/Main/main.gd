extends Node2D



func _on_play_pressed():
	$AudioStreamPlayer.play()
	SceneTransition._change_scene("res://Scene/GameplayScene/gameplay_scene.tscn")


func _on_tutorial_pressed():
	$AudioStreamPlayer.play()
	SceneTransition._change_scene("res://Scene/Tutorial/Tutorial.tscn")
