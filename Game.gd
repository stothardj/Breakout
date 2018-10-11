extends Node

var block = load("res://Block.tscn")
const ROWS = 7;
const COLS = 5;
const COLORS = [
	Color("#ff0000"),
	Color("#ff8800"),
	Color("#ffff00"),
	Color("#00ff00"),
	Color("#00ff88"),
	Color("#00ffff"),
	Color("#0000ff")
]

func _ready():
	print("Game Started")
	load_blocks()
	start_ball()

func load_blocks():
	var color
	for row in range(ROWS):
		color = COLORS[row % ROWS]
		for col in range(COLS):
			var b = block.instance()
			b.init(Vector2(120 + 200 * col, 30 + row * 40), color)
			b.add_to_group("Blocks")
			add_child(b)

func start_ball():
	$Ball.set_linear_velocity(Vector2(300, -200))