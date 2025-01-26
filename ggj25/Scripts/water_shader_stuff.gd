extends Sprite2D


func _physics_process(delta: float) -> void:
	global_position = $"../Player".global_position
	var viewport_size = get_viewport_rect().size
	scale = viewport_size / texture.get_size()
