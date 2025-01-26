extends Node2D

var bubbleInstances = [preload("res://Scenes/Bubble_Effects/o2.tscn"),	# 40%
preload("res://Scenes/Bubble_Effects/sf6.tscn"),						# 20%
preload("res://Scenes/Bubble_Effects/he.tscn"),							# 20%
preload("res://Scenes/Bubble_Effects/co2.tscn"),						# 9%
preload("res://Scenes/Bubble_Effects/oh2.tscn"),						# 10%
preload("res://Scenes/Bubble_Effects/gold_bubble.tscn"),				# 1%
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

	var bubble_picker:int = randi_range(1, 100)
	
	if (0 < bubble_picker) and (bubble_picker <= 40):
		var new_bubble : Bubble = bubbleInstances[0].instantiate()
	elif (40 < bubble_picker) and (bubble_picker <= 60):
		var new_bubble : Bubble = bubbleInstances[1].instantiate()
	elif (60 < bubble_picker) and (bubble_picker <= 80):
		var new_bubble : Bubble = bubbleInstances[2].instantiate()
	elif (80 < bubble_picker) and (bubble_picker <= 89):
		var new_bubble : Bubble = bubbleInstances[3].instantiate()
	elif bubble_picker == 90:
		var new_bubble : Bubble = bubbleInstances[5].instantiate()
	elif (90 < bubble_picker) and (bubble_picker <= 100):
		var new_bubble : Bubble = bubbleInstances[4].instantiate()
	else:
		var new_bubble : Bubble = bubbleInstances[0].instantiate()
		
		
	var new_bubble : Bubble = bubbleInstances.pick_random().instantiate()
	
	# Position the bubble relative to the player
	var bubble_offset = Vector2(0, 0)
	# Circle spawn
	spawn_radius = (get_viewport_rect().size.y)
	var dir = Vector2(randf_range(-10,10),randf_range(-10,10)).normalized()
	bubble_offset = spawn_radius*dir
	
	new_bubble.position = $"..".position + bubble_offset
	new_bubble.size = randi_range(1,3)
	
	# Get the BubbleContainer node
	var bubble_container = $"../../BubbleContainer"
	if bubble_container:
		bubble_container.add_child(new_bubble)  # Add the bubble to the stationary node
	# Add to bubble count
	bubblesSpawned += 1
	#print(bubblesSpawned)
	
func _on_timer_timeout() -> void:
	#print("timer start")
	_spawn_bubble()
