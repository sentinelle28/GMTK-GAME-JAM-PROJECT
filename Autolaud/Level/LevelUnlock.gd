extends Node

var LevelDict:Dictionary = {0:true,1:true,2:false,3:false,4:false,5:false,6:false,7:false,8:false,9:false}
var last_unlock_level:int = 1

func _unlock_level(level:int)->void:
	LevelDict[level] = true
	
func _get_last_level()->int:
	return last_unlock_level

func _set_last_level(last:int)->void:
	last_unlock_level = last

func _get_level(level:int)->bool:
	return LevelDict[level]
