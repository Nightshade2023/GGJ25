extends Bubble

@export var refill_amount = randf_range(2.0, 10.0)

func do_behavior(entity):
	# O2 Behavior
	if entity.is_in_group("player"):
		print(entity.Breath)
		print("BREATHE DAMN YOU!")
		entity.Breath += refill_amount
	$Sprite2D/AnimationPlayer.play("pop_o2")
	if entity.is_in_group("player"):
		print(entity.Breath)
	


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	print("Popped!")
	queue_free()
