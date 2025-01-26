extends ProgressBar
	
func _process(delta):
	var player = get_parent()
	self.value = player.Breath
	rotation = -player.global_rotation
	global_position = player.global_position + Vector2(-40, -60)
