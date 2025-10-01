extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	
	#This code doesn't actually do anything but godot gets mad at me when theres nothing in _ready
	#even with pass it still gets mad lol
	var p1_pts = $player1_points;
	var p2_pts = $player2_points;
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#I can't believe this works lol. Its inelegant to have two functions but its also 6 in the morning sooo
func update_png_p1(score):
	if score < 10:
		$player1_points.texture = load("res://art/hud_pngs/%d.png" % score);
	else:
		$player1_points.texture = load("res://art/hud_pngs/cuteface.png");

func update_png_p2(score):
	if score < 10:
		$player2_points.texture = load("res://art/hud_pngs/%d.png" % score);
	else:
		$player2_points.texture = load("res://art/hud_pngs/cuteface.png");
