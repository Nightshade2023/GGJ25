class_name SaveGame
extends Resource

const SAVE_GAME_PATH := "res://save_game.tres"

@export var scores : Array

func write_savegame() -> void:
	if scores.size() > 5:
		scores.sort()
		scores.reverse()
		scores.resize(5)
	ResourceSaver.save(self, SAVE_GAME_PATH)
	
static func load_savegame() -> Resource:
	if ResourceLoader.exists(SAVE_GAME_PATH):
		return load(SAVE_GAME_PATH)
	return null
