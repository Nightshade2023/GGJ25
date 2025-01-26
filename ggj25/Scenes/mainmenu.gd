extends Control

func _on_theme_1_pressed() -> void:
	$AudioStreamPlayer2D.stream = ResourceLoader.load("res://GJ_Music.ogg")
	$AudioStreamPlayer2D.play()

func _on_theme_2_pressed() -> void:
	$AudioStreamPlayer2D.stream = ResourceLoader.load("res://example_melody_GGJ25.mp3")
	$AudioStreamPlayer2D.play()
