class_name Paddle
extends CharacterBody2D
var direction;
var speed = 500;

var input_manager: InputManager

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setup_input_manager(im: InputManager):
	input_manager = im

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not input_manager:
		return
	direction = input_manager.get_direction()
	velocity.y = direction * speed;
	
	move_and_slide()
	
	
	


	
