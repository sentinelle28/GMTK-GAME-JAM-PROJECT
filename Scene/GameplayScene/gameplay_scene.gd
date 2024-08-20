extends Node2D

var current_showed:int = 5

func _ready():
	var last:int = LevelUnlock._get_last_level()
	for i:int in range(len(LevelUnlock.LevelDict.keys())):
		if i == last:
			var tween:Tween = get_tree().create_tween()
			tween.tween_property(get_child(i),"self_modulate",Color.WHITE,1)
			LevelUnlock._unlock_level(last)
			break
		else:
			get_child(i).self_modulate = Color.WHITE


func _on_level_1_pressed():
	
	SceneTransition._change_scene("res://Scene/Levels/level_1.tscn")

func _on_level_2_pressed():
	if LevelUnlock._get_level(1) == true:
		SceneTransition._change_scene("res://Scene/Levels/level_2.tscn")


func _on_level_3_pressed():
	if LevelUnlock._get_level(2) == true:
		SceneTransition._change_scene("res://Scene/Levels/level_3.tscn")


func _on_level_4_pressed():
	if LevelUnlock._get_level(3) == true:
		SceneTransition._change_scene("res://Scene/Levels/level_4.tscn")


func _on_next_pressed():
	for i in range(5):
		get_child(i+current_showed).show()
	if current_showed == 5:
		current_showed = 0
		for i in range(5):
			get_child(i+current_showed).hide()
	else:
		current_showed = 5
		for i in range(5):
			get_child(i+current_showed).hide()
