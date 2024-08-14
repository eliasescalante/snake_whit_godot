extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var boton = $gui/start
	pass # Replace with function body.
	
	boton.pressed.connect(self._on_my_button_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_my_button_pressed():
	var level = load("res://game/game.tscn")
	if level:
		get_tree().change_scene_to_packed(level)
	else:
		print("error")
