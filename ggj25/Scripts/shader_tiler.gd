extends Node2D

# The scene to be tiled (must contain a Sprite2D as its root or a child)
@export var tile_scene: PackedScene

func _ready():
	if not tile_scene:
		print("No tile_scene set! Please assign a scene to tile.")
		return

	# Instance the tile scene to get the sprite's size
	var tile_instance = tile_scene.instantiate()
	if not tile_instance or not tile_instance is Sprite2D:
		print("The provided tile_scene does not contain a Sprite2D as the root.")
		return

	var sprite_size = tile_instance.texture.get_size() * tile_instance.scale

	# Calculate the number of tiles needed
	var tile_count_x = ceil(GameInfo.map_size.x / sprite_size.x)
	var tile_count_y = ceil(GameInfo.map_size.y / sprite_size.y)

	# Add tiles to the Tiler node
	for x in range(-tile_count_x/2, tile_count_x/2):
		for y in range(-tile_count_y/2, tile_count_y/2):
			var new_tile = tile_scene.instantiate()
			if new_tile:
				add_child(new_tile)
				new_tile.position = Vector2(x * sprite_size.x, y * sprite_size.y)
