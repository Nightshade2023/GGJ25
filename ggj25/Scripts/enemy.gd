extends CharacterBody2D

@export var point_of_interest : Node
var obstacles := []
const SPEED = 400.0
const ACCEL = 10.0


# Declare variables
@onready var raycast = RayCast2D.new()  # Create a RayCast2D instance

func _ready() -> void:
	# Add the RayCast2D node dynamically to the enemy
	add_child(raycast)
	raycast.enabled = true
	raycast.add_exception(self)

func has_line_of_sight(target: Node2D) -> bool:
	# Set RayCast2D's starting and ending positions
	raycast.global_position = global_position  # Start from the enemy's position
	raycast.target_position = raycast.to_local(target.global_position)
	#print(target)
	#print(target.global_position)
	# Perform a collision check
	raycast.force_raycast_update()  # Update the raycast
	var colliding_body = raycast.get_collider()
	#print(raycast.get_collider())
	# Check if the collision is the player or if something is in the way
	return colliding_body == target


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
	var dot0 = velocity.dot(Vector2(0,1))
	var dot1 = velocity.dot(Vector2(0,-1))
	var dot2 = velocity.dot(Vector2(1,0))
	var dot3 = velocity.dot(Vector2(-1,0))

	match max(dot0, dot1, dot2, dot3):
		dot0:
			$AnimatedSprite2D.play("WalkDown")
		dot1:
			$AnimatedSprite2D.play("WalkUp")
		dot2:
			$AnimatedSprite2D.play("WalkRight")
		dot3:
			$AnimatedSprite2D.play("WalkLeft")
	#print(global_position)
	move_and_slide()


func _on_plr_detector_body_entered(body: Node2D) -> void:
	#print("I smell something")
	if body.is_in_group("player"):
		#print("I smell someone")
		if has_line_of_sight(body):
			point_of_interest = body
			#print("I see you")
	if body.is_in_group("enemy_obstacle"):
		obstacles.append(body)
		


func _on_plr_detector_body_exited(body: Node2D) -> void:
	if body == point_of_interest:
		point_of_interest = null
	if body in obstacles:
		obstacles.erase(body)


func _on_attack_body_entered(body: Node2D) -> void:
	if body.has_method("die"):
		get_tree().change_scene_to_file("res://Scenes/DeathCutscene.tscn")
