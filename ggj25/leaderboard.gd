extends Control

var score_data : SaveGame
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score_data = SaveGame.load_savegame()
	var high_scores = get_highest_scores(score_data.scores, 5)
	if high_scores.size() >= 1:
		$VBoxContainer/Label.text =  str(high_scores[0])
	if high_scores.size() >= 2:
		$VBoxContainer/Label2.text = str(high_scores[1])
	if high_scores.size() >= 3:
		$VBoxContainer/Label3.text = str(high_scores[2])
	if high_scores.size() >= 4:
		$VBoxContainer/Label4.text = str(high_scores[3])
	if high_scores.size() >= 5:
		$VBoxContainer/Label5.text = str(high_scores[4])
	
func get_highest_scores(scores: Array, count: int = 1) -> Array:
	if scores.size() == 0:
		return []
	scores.sort()
	scores.reverse() # Sort in descending order
	return scores.slice(0, count)  # Return the top 'count' scores

	


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
