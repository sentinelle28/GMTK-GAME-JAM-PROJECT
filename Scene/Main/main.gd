extends Node2D



func _on_play_pressed():
	SceneTransition._change_scene("res://Scene/GameplayScene/gameplay_scene.tscn")


func _on_tutorial_pressed():
	SceneTransition._change_scene("res://Scene/Tutorial/Tutorial.tscn")
