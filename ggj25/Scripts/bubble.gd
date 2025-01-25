extends Area2D
class_name Bubble


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("body_entered", _on_body_entered)
	add_to_group("bubble")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func do_behavior(entity):
	pass

func _on_body_entered(body: Node2D) -> void:
	print("GET AWAY!!")
	# Signal Effect Given
	print("Effect Applied!")
	do_behavior(body)
	# Trigger Pop Animation
	print("Popping!")
	# Pop
	print("*Dies*")
	#queue_free()
