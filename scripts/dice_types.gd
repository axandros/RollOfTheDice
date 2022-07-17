extends Node

var dice = {}

func GetDieType(type_name):
	for data in dice.keys():
			var item = dice[data]
			if item[0] == type_name:
				return item
	return null

func _ready():
	print("running dice types")
	var die_file = File.new()
	var error = die_file.open("res://dice.dat", die_file.READ)
	if die_file.is_open():
		while !die_file.eof_reached():
			var data_set = Array(die_file.get_csv_line())
			#print(data_set)
			dice[dice.size()] = data_set
		#print(dice)
#		for data in dice.keys():
#			var item = dice[data]
#			print(item)
		
	else:
		print("\tCould not open file: " + var2str(error))
	pass
