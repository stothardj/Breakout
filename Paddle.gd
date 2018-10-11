extends Area2D

export (int) var speed
var screensize
var margin_left
var margin_right

func _ready():
	screensize = get_viewport().size
	margin_left = $ColorRect.margin_left
	margin_right = $ColorRect.margin_right

func _process(delta):
	player_control(delta)

func player_control(delta):
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")
	position.x += (int(right) - int(left)) * speed * delta
	position.x = clamp(position.x, -margin_left, screensize.x - margin_right)

func _on_Paddle_body_entered(body):
	if body.get_name() == "Ball":
		body.linear_velocity = body.linear_velocity.bounce(Vector2(0, 1))
