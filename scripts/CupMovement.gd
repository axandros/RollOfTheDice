extends MeshInstance

export var down_location = Vector3(0,0,0)
#export var down_rotation = Vector3(0,0,0)

export var up_location = Vector3(0,0,0)
#export var up_rotation = Vector3(0,0,0)

var lerp_percent = 0
var direction = true

func _ready():
	transform.origin = down_location
#	transform.basis = down_rotation
	pass 



func _process(delta):
	if(direction):
		lerp_percent += 0.5 * delta
		if lerp_percent >= 1:
			direction = !direction
	else:
		lerp_percent -= 0.5 * delta
		if lerp_percent <= 0:
			direction = !direction
	transform.origin = lerp(down_location, up_location, lerp_percent)
#	transform.basis = lerp(down_rotation, up_rotation, lerp_percent)
	pass
