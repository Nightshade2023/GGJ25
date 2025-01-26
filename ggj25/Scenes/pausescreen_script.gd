extends CanvasLayer	

func _ready() -> void:
	$"SettingsPage/Panel/musiclabel/musicbar".value = GameInfo.music_vol
	$"SettingsPage/Panel/SFXlabel/SFXbar".value = GameInfo.sfx_vol

func _input(event):
	if event.is_action_pressed("Pause") and get_node("SettingsPage").visible == false:
		get_node("PanelContainer").visible = !get_node("PanelContainer").visible
		Engine.time_scale = !Engine.time_scale


func _on_resume_button_pressed() -> void:
	get_node("PanelContainer").visible = !get_node("PanelContainer").visible
	Engine.time_scale = !Engine.time_scale


func _on_settings_pause_menu_button_pressed() -> void:
	var settingspage = get_node("SettingsPage")
	if settingspage:
		settingspage.visible = not settingspage.visible
		get_node("PanelContainer").visible = !get_node("PanelContainer").visible


func _on_main_menu_button_pressed() -> void:
	get_node("PanelContainer").visible = !get_node("PanelContainer").visible
	Engine.time_scale = !Engine.time_scale
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")

func _on_musicbar_drag_ended(value_changed: bool) -> void:
	if value_changed:
		GameInfo.music_vol = $"SettingsPage/Panel/musiclabel/musicbar".value
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(GameInfo.music_vol))

func _on_sf_xbar_drag_ended(value_changed: bool) -> void:
	if value_changed:
		GameInfo.music_vol = $"SettingsPage/Panel/musiclabel/musicbar".value
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(GameInfo.sfx_vol))
		

func _on_musicbar_value_changed(value: float) -> void:
	GameInfo.music_vol = value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(GameInfo.music_vol))

func _on_sf_xbar_value_changed(value: float) -> void:
	GameInfo.music_vol = value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(GameInfo.sfx_vol))
