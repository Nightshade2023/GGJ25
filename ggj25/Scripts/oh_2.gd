extends Bubble

var character : CharacterBody2D

func do_behavior(entity):
	if entity.is_in_group("player"):
		# Perma Suit Damage
		entity.BreathLossRate += 0.2
		entity._player_hurt()
		
	# Knockback
	if not entity.is_in_group("enemy_obstacle"):
		var knockback_direction: Vector2
		var knockback_force:float = 1500.0
		knockback_direction = entity.global_position - global_position
		knockback_direction = knockback_direction.normalized()
		entity.velocity += knockback_direction * knockback_force
		
	$AudioStreamPlayer2D.play()
	$AnimatedSprite2D.play()
	
	
func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()
