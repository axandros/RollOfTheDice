extends Spatial

signal on_roll_end(value)

var dice = []

var deck = ["Omen", "Gambler","Lord","Pauper","King"]
var discard = []

var sum = 0
var dice_values_reported = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	dice.append(get_node("Die1"))
	dice.append(get_node("Die2"))
	dice.append(get_node("Die3"))
	dice.append(get_node("Die4"))
	dice.append(get_node("Die5"))
	for die in dice:
		die.connect("die_roll_sig", self, "add_roll_value")
	
func add_roll_value(val):
	sum += val as int
	dice_values_reported += 1
	if dice_values_reported == 5:
		emit_signal("on_roll_end", sum)
	print("New sum: " + var2str(sum) + " / " + var2str(dice_values_reported))
	
func draw_dice():
	for die in dice:
		if(deck.size() == 0):
			for s in discard:
				deck.append(s);
			discard = [];
			if deck.size() == 0:
				pass # Win Game!
		var j = floor(rand_range(0, deck.size()))
		die.set_die(deck[j])
		discard.append(deck[j])
		deck.remove(j)

func launch_dice():
	sum = 0
	dice_values_reported = 0
	var i = -2
	for die in dice:
		die.transform.origin = Vector3(2.5*i, 0, 0)
		die.launch()
		i += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
