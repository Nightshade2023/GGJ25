extends Panel

func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Credits.tscn")


func _on_settings_button_pressed() -> void:
	var settingspage = get_node("../../SettingsPage")
	print(settingspage)
	if settingspage:
		settingspage.visible = not settingspage.visible
