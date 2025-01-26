extends TileMapLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for x in range(-GameInfo.map_size.x/3200,GameInfo.map_size.x/3200):
		for y in range(-GameInfo.map_size.y/3200,GameInfo.map_size.y/3200):
			set_cell(Vector2(x,y),0,Vector2(0,0),0)
