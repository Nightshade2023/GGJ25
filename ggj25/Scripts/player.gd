extends CharacterBody2D
class_name CustomPlayer2D

var SPEED = 500.0
const ACCEL = 2.0
const JUMP_VELOCITY = -400.0
const DASHSPEED := 2000.0

var TimeAlive = 0

@export var BreathLossRate = 0.5
@export var Breath = 100.0
@export var score : int

func _physics_process(delta: float) -> void:
	TimeAlive += delta
	_handle_player_controls(delta)
	_tick_breath(delta)
	score = int(TimeAlive)
	#print(score)
	#print(Breath)
	move_and_slide()
	Breath = clamp(Breath, 0, 100)
	
func _handle_player_controls(delta: float) -> void:
	var direction:= Vector2(int(Input.is_action_pressed("D")) - int(Input.is_action_pressed("A")),int(Input.is_action_pressed("S")) - int(Input.is_action_pressed("W"))).normalized()
	velocity = lerp(velocity, direction * SPEED, ACCEL * delta)
	var look_pos = global_position + Vector2(-velocity.y, velocity.x)
	look_at(look_pos)
	if velocity.length() < 20:
		$AnimatedSprite2D.stop()
	else:
		$AnimatedSprite2D.play("default")
	# Dash
	if Input.is_action_just_pressed("Shift"):
		SPEED += DASHSPEED
		$DashTimer.start()
		Breath -= 10
		$AnimatedSprite2D.speed_scale = 3
	print(Breath)
	
func _tick_breath(delta: float) -> void:
	Breath -= BreathLossRate * delta


func _on_dash_timer_timeout() -> void:
	SPEED = 500.0
	$AnimatedSprite2D.speed_scale = 1
	
func die():
	
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn") # Temporary
