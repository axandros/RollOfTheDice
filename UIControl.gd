extends Control

# Game World
onready var player = $"../PlayerDice"

# UI
onready var roll_button = $CanvasLayer/btn_Roll


# Called when the node enters the scene tree for the first time.
func _ready():
	roll_button.connect("button_up", self, "on_roll")
	pass # Replace with function body.


func on_roll():
	player.draw_dice()
	player.launch_dice()
	pass
