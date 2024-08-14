# game.gd
extends Node2D

@onready var food = $food
var grid_size = 10  # Tamaño de cada celda en la cuadrícula

func _ready():
	randomize_food_position()

func randomize_food_position():
	var max_x = (int(get_viewport().size.x / grid_size) - 1) * grid_size
	var max_y = (int(get_viewport().size.y / grid_size) - 1) * grid_size

	var random_position = Vector2(
		int(randi_range(0, max_x / grid_size)) * grid_size,  # Usar int() para garantizar que el resultado sea un entero
		int(randi_range(0, max_y / grid_size)) * grid_size
	)

	food.position = random_position
