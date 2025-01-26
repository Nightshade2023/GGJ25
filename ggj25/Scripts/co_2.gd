extends Bubble


func do_behavior(entity):
	$AudioStreamPlayer2D.play()
	$AnimatedSprite2D.play()


func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()
