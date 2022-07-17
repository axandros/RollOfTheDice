extends Spatial

var dice = []

var deck = ["Omen", "Gambler","Lord","Pauper","King"]
var discard = []

# Called when the node enters the scene tree for the first time.
func _ready():
	dice.append(get_node("Die1"))
	dice.append(get_node("Die2"))
	dice.append(get_node("Die3"))
	dice.append(get_node("Die4"))
	dice.append(get_node("Die5"))
	
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
	var i = -2
	for die in dice:
		die.transform.origin = Vector3(2.5*i, 0, 0)
		die.launch()
		i += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
