extends Node2D


func _on_timer_timeout() -> void:
	$CanvasLayer/AnimatedSprite2D.play("PinchRight")


func _on_animated_sprite_2d_animation_finished() -> void:
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
