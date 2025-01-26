extends Control

func _ready() -> void:
	$AudioStreamPlayer2D.stream = GameInfo.current_theme
	$AudioStreamPlayer2D.play()

func _on_theme_1_pressed() -> void:
	GameInfo.current_theme = ResourceLoader.load("res://GJ_Music.ogg")
	$AudioStreamPlayer2D.stream = GameInfo.current_theme
	$AudioStreamPlayer2D.play()

func _on_theme_2_pressed() -> void:
	GameInfo.current_theme = ResourceLoader.load("res://example_melody_GGJ25.mp3")
	$AudioStreamPlayer2D.stream = GameInfo.current_theme
	$AudioStreamPlayer2D.play()
