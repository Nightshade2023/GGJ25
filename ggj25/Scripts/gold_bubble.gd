extends Bubble

# Max Refill cuz Gold
@onready var refill_amount = 100.0

func _ready() -> void:
	super()
	size = 2

func do_behavior(entity):
	
	if entity.is_in_group("player"):
		entity.Breath += refill_amount
		
	$AudioStreamPlayer2D.play()
	$AnimatedSprite2D.play()


func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()
