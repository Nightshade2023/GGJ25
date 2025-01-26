extends Panel

func _ready() -> void:
	$"../../SettingsPage/Panel/musiclabel/musicbar".value = GameInfo.music_vol
	$"../../SettingsPage/Panel/SFXlabel/SFXbar".value = GameInfo.sfx_vol

func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Credits.tscn")


func _on_settings_button_pressed() -> void:
	var settingspage = get_node("../../SettingsPage")
	print(settingspage)
	if settingspage:
		settingspage.visible = not settingspage.visible


func _on_musicbar_drag_ended(value_changed: bool) -> void:
	if value_changed:
		GameInfo.music_vol = $"../../SettingsPage/Panel/musiclabel/musicbar".value
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(GameInfo.music_vol))

func _on_sf_xbar_drag_ended(value_changed: bool) -> void:
	if value_changed:
		GameInfo.music_vol = $"../../SettingsPage/Panel/musiclabel/musicbar".value
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(GameInfo.sfx_vol))
		


func _on_musicbar_value_changed(value: float) -> void:
	GameInfo.music_vol = value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(GameInfo.music_vol))


func _on_sf_xbar_value_changed(value: float) -> void:
	GameInfo.music_vol = value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(GameInfo.sfx_vol))


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/world.tscn") # Temporary


func _on_leader_board_button_pressed() -> void:
	get_tree().change_scene_to_file("res://leaderboard.tscn")
