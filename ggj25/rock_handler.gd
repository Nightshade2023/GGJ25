extends Node2D

var rock = preload("res://Scenes/rock.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(20000):
		var this_rock = rock.instantiate()
		this_rock.type = randi_range(0,4)
		this_rock.global_position = Vector2(randf_range(-GameInfo.map_size.x/2,GameInfo.map_size.x/2),randf_range(-GameInfo.map_size.y/2,GameInfo.map_size.y/2))
		add_child(this_rock)
		
