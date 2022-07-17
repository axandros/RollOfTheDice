extends Control


export var width = 5
var die
var camera

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _draw():
	var color = Color(0,1,0)
	var start = camera.unproject_position(die.global_transform.origin)
	var end = camera.unproject_position(die.global_tranform.origin+die.toss_direction*die.toss_speed)
	draw_line(start,end, color, width)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
