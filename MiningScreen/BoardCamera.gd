extends Camera2D


export(float) var _MAX_ZOOM: float = 8
var _min_zoom: float = 1

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and event.button_mask == BUTTON_RIGHT:
		offset -= event.relative * zoom.x
	elif event is InputEventMouseButton:
		match event.button_index:
			BUTTON_WHEEL_UP:
				_zoom(1.1, event.position)
			BUTTON_WHEEL_DOWN: 
				_zoom(-1.1, event.position)

func _zoom(factor: float, where: Vector2) -> void:
	if factor < 0:
		factor = -1 / factor
	var pos1 := where * zoom.x
	zoom *= factor
	zoom = Vector2(1, 1) * max(_min_zoom, min(_MAX_ZOOM, zoom.x))
	var pos2 := where * zoom.x
	offset += (pos1 - pos2)

func _on_MiningScreen_game_started() -> void:
	pass