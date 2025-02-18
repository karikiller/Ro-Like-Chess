extends Node2D

@export var room_scene: PackedScene  # ChessRoom.tscn

func _ready():
	generate_floor(5)  # Генерируем 5 случайных комнат

func generate_floor(room_count: int):
	var last_position = Vector2(0, 0)
	
	for i in range(room_count):
		var room = room_scene.instantiate()
		room.position = last_position
		add_child(room)
		
		# Вызываем генерацию уникальной шахматной задачи в этой комнате
		room.generate_random_puzzle()
		
		# Сдвигаем следующую комнату вправо
		last_position += Vector2(300, 0)
