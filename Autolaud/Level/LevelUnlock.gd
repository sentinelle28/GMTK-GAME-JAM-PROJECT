extends Node

var LevelDict:Dictionary = {1:true,2:false}

func _unlock_level(level:int)->void:
	LevelDict[level] = true
	
