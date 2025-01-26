extends Node2D

var bubbleInstances = [preload("res://Scenes/Bubble_Effects/o2.tscn"),preload("res://Scenes/Bubble_Effects/sf6.tscn"),preload("res://Scenes/Bubble_Effects/he.tscn")
]
var bubblesSpawned: int
var spawn_radius := 500

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _spawn_bubble():
	if bubbleInstances.size() == 0:
		print("No bubbles.")
		return

	var new_bubble : Bubble = bubbleInstances.pick_random().instantiate()
	
	# Position the bubble relative to the player
	var bubble_offset = Vector2(0, 0)
	# Circle spawn
	spawn_radius = (get_viewport_rect().size.y)
	var x_dir = (randi_range(0,1)*2)-1
	var y_dir = (randi_range(0,1)*2)-1
	bubble_offset.x = spawn_radius*x_dir
	bubble_offset.y = spawn_radius*y_dir
	
	new_bubble.position = $"..".position + bubble_offset
	new_bubble.size = randi_range(1,3)
	
	# Get the BubbleContainer node
	var bubble_container = get_node("/root/Node2D2/BubbleContainer")
	if bubble_container:
		bubble_container.add_child(new_bubble)  # Add the bubble to the stationary node
	# Add to bubble count
	bubblesSpawned += 1
	#print(bubblesSpawned)
	
func _on_timer_timeout() -> void:
	#print("timer start")
	_spawn_bubble()
