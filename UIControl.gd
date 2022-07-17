extends Control

# Game World
onready var player = $"../PlayerDice"

# UI
onready var roll_button = $CanvasLayer/btn_Roll
onready var sum_label = $CanvasLayer/"HBoxContainer/roll_sum" as Label


# Called when the node enters the scene tree for the first time.
func _ready():
	roll_button.connect("button_up", self, "on_roll")
	player.connect("on_roll_end", self, "update_sum")
	pass # Replace with function body.


func on_roll():
	player.draw_dice()
	player.launch_dice()
	pass

func update_sum(val):
	print("updating sum")
	sum_label.text = var2str(val)
