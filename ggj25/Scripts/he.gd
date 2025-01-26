extends Bubble

var character : CharacterBody2D

func do_behavior(entity):
	if entity.has_method("set_speed_scale"):
		entity.set_speed_scale(size + 0.2, size)
	$AudioStreamPlayer2D.play()
	$AnimatedSprite2D.play()
	
	


func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()
