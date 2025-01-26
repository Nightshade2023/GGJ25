extends Bubble

@onready var refill_amount = randf_range(2.0 * size, 10.0 * size)

func do_behavior(entity):
	# O2 Behavior
	if entity.is_in_group("player"):
		#print(entity.Breath)
		#print("BREATHE DAMN YOU!")
		entity.Breath += refill_amount
	$AnimatedSprite2D.play()
	#if entity.is_in_group("player"):
		#print(entity.Breath)

func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()
