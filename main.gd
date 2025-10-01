extends Node
@export var paddle1: Paddle
@export var paddle2: Paddle
var winning_player =0;

var player1_point = 0;
var player2_point = 0;





# Called when the node enters the scene tree for the first time.
func _ready():
	var player1_input = Player1Input.new()
	paddle1.setup_input_manager(player1_input)
	var player2_input = Player2Input.new()
	paddle2.setup_input_manager(player2_input)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func increment_point(boolean):
	if boolean == true:
		player1_point +=1;
		$HUD.update_png_p1(player1_point);
		print(" Player 1 points:", player1_point, " Player 2 points: ", player2_point)
	else:
		player2_point +=1;
		$HUD.update_png_p2(player2_point);
		print( "Player 1 points:", player1_point, " Player 2 points:", player2_point)
		
		
	
func game_over_check():
	if player1_point >=10: 
		winning_player = 1;
		return true;
	elif player2_point >=10:
		winning_player = 2;
		return true;
	else:
		return false;


func end_game():
	#stop ball
	$ball.ball_stop();
	
	print(" congrats player" + str(winning_player))


func reset_board():
	#move ball to original spot
	$ball.position = Vector2(720,480);
	
	$ball.y_dir = 0;
	


func ball_exit_add_point():
	#$ball.queue_free() did not work because I had to instantiate a new ball, which would not carry my same script.
	#its easier to just move the ball back to its starting place instead of deleting and creating a new one
	

	
	#Add point
	increment_point($ball.player1_hit)
	


	#check if game ended()
	if game_over_check():
		#end game lol
		end_game();
	else:
		reset_board();
		#add x velocity to ball
		$ball.ball_move();
