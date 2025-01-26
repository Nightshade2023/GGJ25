extends Area2D
class_name Bubble

@export var size: int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	match size:
		1:
			$AnimatedSprite2D.animation = "Small"
		2:
			$AnimatedSprite2D.animation = "Medium"
		3:
			$AnimatedSprite2D.animation = "Large"
	$CollisionShape2D.scale = Vector2(((size+1)/2),((size+1)/2))
	$AnimatedSprite2D.set_frame_and_progress(0,0)
	#print("BUBBLES")
	connect("body_entered", _on_body_entered)
	add_to_group("bubble")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func do_behavior(entity):
	pass

func _on_body_entered(body: Node2D) -> void:
	#print("GET AWAY!!")
	# Signal Effect Given
	#print("Effect Applied!")
	if body is CharacterBody2D:
		do_behavior(body)
	# Trigger Pop Animation
	#print("Popping!")
	# Pop
	#print("*Dies*")
	#queue_free()
