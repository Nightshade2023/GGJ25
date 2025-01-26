extends Node2D

var crab := preload("res://Scenes/crab.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var this_crab = crab.instantiate()
	this_crab.global_position = Vector2(randf_range(-GameInfo.map_size.x/2,GameInfo.map_size.x/2),randf_range(-GameInfo.map_size.y/2,GameInfo.map_size.y/2))
	this_crab.z_index = 0
	add_child(this_crab)



func _on_timer_timeout() -> void:
	var this_crab = crab.instantiate()
	this_crab.global_position = Vector2(randf_range(-GameInfo.map_size.x/2,GameInfo.map_size.x/2),randf_range(-GameInfo.map_size.y/2,GameInfo.map_size.y/2))
	this_crab.z_index = 0
	add_child(this_crab)
