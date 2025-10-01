extends CharacterBody2D

var x_speed = 15
var x_dir = 1
var y_speed = 5;
var y_dir = 0
var player1_hit= true;

signal add_point;


func _physics_process(delta):
	ball_move();

		
func ball_stop():
	x_speed =0;
	y_speed =0;
	ball_move();
	
func ball_move():
	
		#velocity = Vector2(SPEED,0)
	var collision = move_and_collide(Vector2(x_speed * x_dir, y_speed * y_dir))
	if collision:
		#changes direction of ball on collision with paddle
		paddle_bounce();
		
		#Tracks last player to hit ball
		change_point_getter()
		
		
#maybe polar coordinates? angle could be pi/y distance from ball to center of paddle?
		
		
func paddle_bounce():
	
	#Detects what paddle ball is bouncing off of
	var paddle;
	if position.x < 500:
		paddle = get_parent().paddle1;
	else:
		paddle = get_parent().paddle2;

	#Get height of paddle
	var paddle_y = paddle.position.y;
	var ball_y = position.y;
	var distance = paddle_y - ball_y;
	var paddle_hitbox = paddle.get_node("CollisionShape2D");
	var paddle_height = paddle_hitbox.shape.size.y;
	

	
	#bounce angle
	var max_bounce_angle = PI/2; #60 degrees
	var bounce_angle = (distance / (paddle_height / 2)) * max_bounce_angle #I don't understand this math, need to learn
	x_dir *= -1;
	y_dir = sin(bounce_angle) * -1;

	move_and_collide(Vector2(x_speed * x_dir, y_speed * y_dir))
	
	

		
		


func y_dir_flip():
	y_dir = y_dir * -1;
	
func x_dir_flip():
	x_dir = x_dir * -1;

func change_point_getter():
		if player1_hit == true:
			player1_hit = false;
		else:
			player1_hit = true;

func _on_board_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	var ball_y = position.y;
	if ball_y < 0 or ball_y > 970:
		y_dir_flip();
		move_and_collide(Vector2(x_speed * x_dir, y_speed * y_dir));
		
	else:
		emit_signal("add_point");
		
