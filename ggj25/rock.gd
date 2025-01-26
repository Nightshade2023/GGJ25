extends StaticBody2D

@export var type : int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotation_degrees = randf_range(0,360)
	match type:
		0:
			$AnimatedSprite2D.animation = "small1"
			$CollisionShape2D.scale.x = 1
			$CollisionShape2D.scale.y = 1
		1:
			$AnimatedSprite2D.animation = "small2"
			$CollisionShape2D.scale.x = 1.1
			$CollisionShape2D.scale.y = 1
		2:
			$AnimatedSprite2D.animation = "medium1"
			$CollisionShape2D.scale.x = 2.2
			$CollisionShape2D.scale.y = 2
		3:
			$AnimatedSprite2D.animation = "medium2"
			$CollisionShape2D.scale.x = 2.5
			$CollisionShape2D.scale.y = 2
		4:
			$AnimatedSprite2D.animation = "large"
			$CollisionShape2D.scale.x = 4.7
			$CollisionShape2D.scale.y = 3.2
			
