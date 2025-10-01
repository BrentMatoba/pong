class_name Player1Input
extends InputManager

func get_direction():
	return Input.get_axis("player2_up", "player2_down");
