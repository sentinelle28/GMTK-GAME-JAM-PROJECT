extends CharacterBody2D
class_name Player
@export var Size:Vector2i = Vector2i(64,64)
@onready var Stocker:Node2D = $Stocker

var is_growing:bool = false

var CollisionArray:Array[PushableEntities] = []

func _physics_process(_delta:float)->void:
	""" Main function"""
	_pause()
	_move()
	
func _pause()->void:
	if Input.is_action_just_pressed("quit"):
		PauseMenu.show()
		get_tree().paused = true
	if Input.is_action_just_pressed("retry"):
		call_deferred("_reaload")
		

func _reaload()->void:
	InputManager._set_input(true)
	get_tree().reload_current_scene()


func _move()->void:
	
	""" Handle mouvement"""
	#get direction if has permission
	var direction:Vector2i = InputManager._get_vector(["ui_left","ui_right","ui_up","ui_down"])
	#make sure there is no diagonal
	if abs(direction.x) + abs(direction.y) != 2:
		#verify that there is mouvement
		if direction != Vector2i.ZERO:
			$AnimationTree["parameters/blend_position"] = Vector2(direction)
			$walk.play()
			#verify it's not a wall 
			_move_towards(direction)
		
			
		
func _update_scale(Scale:float)->void:
	var new_scale:float = Scale
	var tween:Tween = get_tree().create_tween()
	InputManager._set_input(false)
	#if scale < to 1
	is_growing = true
	if scale.x * new_scale < 1:
		new_scale = 1
	
	$fruit.play()
	
	#different animation
	if new_scale*scale.x < scale.x:
		tween.tween_property(self,"scale",scale*2 ,0.25)
		tween.tween_property(self,"scale",scale*new_scale,0.25)
	else:
		tween.tween_property(self,"scale",scale*0.5 ,0.25)
		tween.tween_property(self,"scale",scale*new_scale ,0.25)
	
	#grow process
	await get_tree().create_timer(0.6).timeout
	#reactivate the input
	InputManager._set_input(true)
	is_growing = false
	
	

func _move_towards(direction:Vector2)->void:
	var collid:KinematicCollision2D = move_and_collide(direction * scale.x,true)
	if collid !=null:
		if collid.get_collider() is PushableEntities:
			collid.get_collider()._push(direction)
			_solve_push(direction)
	else:
		collid = move_and_collide(direction * Vector2(Size) * scale.x)
		if collid !=  null:
			if collid.get_collider() is Fruit:
				collid.get_collider()._use()


func _solve_push(direction:Vector2)->void:
	if CollisionArray.size() != 0:
		if CollisionArray[0]._check_collision(direction):
			for pushable:PushableEntities in CollisionArray:
				pushable.reparent(Stocker)
			Stocker.global_position += direction*Vector2(CollisionArray[0].Size)
			for pushable:PushableEntities in CollisionArray:
				pushable.reparent(get_tree().current_scene)
		
	CollisionArray.clear()
