extends Control

var p_One
var p_Two
var p_Three
var total_counts = [0,0,0,0,0,0]

func roll():
	return floor(rand_range(1,7))

func test_roll_average():
	var counts = [0,0,0,0,0,0, 0]
	for i in 1000000:
		counts[roll()-1] +=1
	for i in 7:
		print(var2str(i+1) + ": " + var2str(counts[i]))
	pass

func init():
	p_One = [roll(), roll(), roll(), roll(), roll()]
	p_Two = [roll(), roll(), roll(), roll(), roll()]
	p_Three = [roll(), roll(), roll(), roll(), roll()]
	for i in p_One:
		total_counts[i-1] += 1
	for i in p_Two:
		total_counts[i-1] += 1
	for i in p_Three:
		total_counts[i-1] += 1
		
	print(p_One)
	print(p_Two)
	print(p_Three)
	print(total_counts)
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	init()
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
