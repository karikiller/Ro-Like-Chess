extends Node2D

@export var pieces_container: PiecesContainer.tscn  # Укажи контейнер для фигур в инспекторе

func _ready():
	generate_random_puzzle()

func generate_random_puzzle():
	# Очистка старых фигур (если есть)
	for child in pieces_container.get_children():
		child.queue_free()
	
	# Пример: случайные фигуры
	var piece_scenes = {
		"pawn": preload("res://Assets/WhitePawn.png"),
		"rook": preload("res://Assets/WhiteRook.png"),
		"knight": preload("res://Assets/WhiteKnight.png"),
		"bishop": preload("res://Assets/WhiteBishop.png"),
		"queen": preload("res://Assets/WhiteQueen.png"),
		"king": preload("res://Assets/WhiteKing.png")
	}
	
	# Рандомно выбираем 3 фигуры
	var selected_pieces = piece_scenes.keys().slice(0, 3)
	
	for piece_name in selected_pieces:
		var piece = Sprite2D.new()
		piece.texture = piece_scenes[piece_name]
		piece.position = Vector2(randi() % 8 * 64, randi() % 8 * 64)  # Случайная позиция на доске
		pieces_container.add_child(piece)
