extends CharacterBody2D
class_name CustomPlayer2D

var SPEED = 500.0
const ACCEL = 2.0
const JUMP_VELOCITY = -400.0
const DASHSPEED := 2000.0

@export var BreathLossRate = 0.5
@export var Breath = 100.0


func _physics_process(delta: float) -> void:
	_handle_player_controls(delta)
	_tick_breath(delta)
	#print(Breath)
	move_and_slide()
	
func _handle_player_controls(delta: float) -> void:
	var direction:= Vector2(int(Input.is_action_pressed("D")) - int(Input.is_action_pressed("A")),int(Input.is_action_pressed("S")) - int(Input.is_action_pressed("W"))).normalized()
	velocity = lerp(velocity, direction * SPEED, ACCEL * delta)
	
	# Dash
	if Input.is_action_just_pressed("Shift"):
		SPEED += DASHSPEED
		$DashTimer.start()
		Breath -= 10
	
func _tick_breath(delta: float) -> void:
	Breath -= BreathLossRate * delta


func _on_dash_timer_timeout() -> void:
	SPEED = 500.0
