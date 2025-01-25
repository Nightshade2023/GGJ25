extends Area2D
class_name Bubble


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("body_entered", _on_body_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func do_behavior():
	pass

func _on_body_entered(body: Node2D) -> void:
	print("GET AWAY!!")
	# Detects Player/Crab Collision
	if body.is_in_group("player"):
		# Signal Effect Given
		print("Effect Applied!")
		# Trigger Pop Animationp
		print("Popping!")
		# Pop
		print("*Dies*")
		queue_free()
	elif body.is_in_group("enemy"):
		# Trigger Pop Animationp
		print("Popping!")
		# Pop
		print("*Dies*")
		queue_free()
