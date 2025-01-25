extends CharacterBody2D

@export var point_of_interest : Node
var obstacles := []
const SPEED = 300.0
const ACCEL = 4.0



func _physics_process(delta: float) -> void:
	var direction := Vector2.ZERO
	if point_of_interest == null:
		var closest_bubble = null
		var closest_distance = 100000000000000 #Arbitrary large number
		var bubbles = get_tree().get_nodes_in_group("bubble")
		for bubble in bubbles:
			var distance = global_position.distance_squared_to(bubble.global_position)
			if distance <= closest_distance:
				closest_bubble = bubble
		if not closest_bubble:
			#print("THERE ARE NO BUBBLES!")
			pass
		else:
			point_of_interest = closest_bubble
	else:
		var avoidance_direction := Vector2.ZERO
		var obstacle_count = 0
		for obstacle in obstacles:
			avoidance_direction += obstacle.global_position - global_position
			obstacle_count+=1
		if obstacle_count > 0:
			avoidance_direction = avoidance_direction/obstacle_count
		direction = point_of_interest.global_position - global_position
		direction = direction + avoidance_direction
		direction = direction.normalized()
		
	velocity = lerp(velocity, SPEED * direction, ACCEL * delta)
	#print(global_position)
	move_and_slide()


func _on_plr_detector_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		point_of_interest = body
	if body.is_in_group("enemy_obstacle"):
		obstacles.append(body)
		


func _on_plr_detector_body_exited(body: Node2D) -> void:
	if body == point_of_interest:
		point_of_interest = null
	if body in obstacles:
		obstacles.erase(body)
