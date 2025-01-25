extends Node2D

var bubbleInstances = [preload("res://Scenes/Bubble_Effects/o2.tscn"),
]
var bubblesSpawned: int

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _spawn_bubble():
	if bubbleInstances.size() == 0:
		print("No bubbles.")
		return

	var new_bubble = bubbleInstances.pick_random().instantiate()
	
	# Position the bubble relative to the player
	var bubble_offset = Vector2(0, 0)
	# Circle spawn, not outside yet
	bubble_offset.x = randf_range(-500.0, 500.0)
	bubble_offset.y = randf_range(-500.0, 500.0)
	
	new_bubble.position = $"..".position + bubble_offset
	
	# Get the BubbleContainer node
	var bubble_container = get_node("/root/Node2D/BubbleContainer")
	if bubble_container:
		bubble_container.add_child(new_bubble)  # Add the bubble to the stationary node
	# Add to bubble count
	bubblesSpawned += 1
	
func _on_timer_timeout() -> void:
	_spawn_bubble()
