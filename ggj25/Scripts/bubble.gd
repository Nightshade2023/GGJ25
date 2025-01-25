extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
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
