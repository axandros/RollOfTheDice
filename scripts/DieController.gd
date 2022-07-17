extends RigidBody

export var toss_speed = 50
export var toss_direction = Vector3(0,0.5,1)

export var random_rotate = true

onready var faces = get_node("Faces")

var launched = false

var die_construct = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	#set_die("Gambler")
	#set_die("Executioner")
	#launch()
	#print("Faces mat count " + var2str(faces.get_surface_material_count()))
	pass 

func set_die(die_type):
	print("Setting Die")
	die_construct = DiceTypes.GetDieType(die_type)
	if die_construct != null:
		faces.set_faces(die_construct)
	pass

func launch():
	linear_velocity =(toss_direction*-toss_speed)
	launched = true
	if random_rotate:
		rotation_degrees = Vector3(rand_range(0,359), rand_range(0,359),rand_range(0,359))

# Called each frame
func _process(delta):
	if(linear_velocity.length() < 0.1 && launched):
		launched = !launched
		var basis = get_global_transform().basis
		var x = stepify(basis.x.y, 0.1)
		var y = stepify(basis.y.y, 0.1)
		var z = stepify(basis.z.y, 0.1)
		if (abs(x) > abs(y) && abs(x) > abs(z)):
			if x > 0:
				print("x+" + var2str(die_construct[4]))
			else:
				print("x-" + var2str(die_construct[1]))
		elif abs(y) > abs(z):
			if y > 0:
				print("y+" + var2str(die_construct[2]))
			else:
				print("y-" + var2str(die_construct[6]))
		else:
			if z > 0:
				print("z+" + var2str(die_construct[3]))
			else:
				print("z-" + var2str(die_construct[5]))
	pass

func roundVector(vec):
	return Vector3(stepify(vec.x, 0.1), stepify(vec.y, 0.1), stepify(vec.z, 0.1))
