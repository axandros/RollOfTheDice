extends MeshInstance
# materials to apply
export (Array, Material) var material_list

# die construct is an array of strings showing the symbol that the corresponding face should display.
func set_faces(die_type):
	var mat = material_list[0]
	if die_type == "Omen":
		mat = material_list[0]
	elif die_type == "Pauper":
		mat = material_list[1]
	elif die_type == "Gambler":
		mat = material_list[2]
	elif die_type == "Lord":
		mat = material_list[3]
	elif die_type == "King":
		mat = material_list[4]
	material_override =mat

