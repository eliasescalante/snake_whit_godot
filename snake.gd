# snake.gd
extends Node2D

@onready var food = get_node("../food")  # Busca el nodo 'Food' en el mismo nivel que 'Snake'
var score = 0
var velocity = Vector2(10, 0)
var segments = []
var move_timer = 0.1
var elapsed_time = 0

func _ready():
	segments.append($ColorRect)  # Primer segmento de la serpiente es la cabeza
	set_process(true)

func _process(delta):
	elapsed_time += delta
	if elapsed_time >= move_timer:
		elapsed_time = 0
		move_snake()
		check_food_collision()
	handle_input()

func handle_input():
	if Input.is_action_pressed("ui_right"):
		velocity = Vector2(10, 0)
	elif Input.is_action_pressed("ui_left"):
		velocity = Vector2(-10, 0)
	elif Input.is_action_pressed("ui_down"):
		velocity = Vector2(0, 10)
	elif Input.is_action_pressed("ui_up"):
		velocity = Vector2(0, -10)

func move_snake():
	var prev_position = segments[0].position
	segments[0].position += velocity

	for i in range(1, segments.size()):
		var temp_position = segments[i].position
		segments[i].position = prev_position
		prev_position = temp_position

func check_food_collision():
	if segments[0].position == food.position:
		grow_snake()
		get_parent().randomize_food_position()  # Llama la función desde el script game.gd
		score += 1

func grow_snake():
	var new_segment = ColorRect.new()
	new_segment.color = Color(1, 1, 1)
	new_segment.position = segments[segments.size() - 1].position
	add_child(new_segment)
	segments.append(new_segment)
