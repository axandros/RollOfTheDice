extends MeshInstance

export (Array, Material) var material_list

var face_order = [2,1, 5, 3, 4, 0]

func set_faces(die_construct):
	for i in 6:
		var face = face_order[i]
		mesh.surface_set_material(face, null)
		var value = die_construct[i+1]
		var mat = material_list[0]
		if value == "0":
			mat = material_list[0]
		elif value == "1":
			mat = material_list[1]
		elif value == "2":
			mat = material_list[2]
		elif value == "3":
			mat = material_list[3]
		elif value == "4":
			mat = material_list[4]
		elif value == "5":
			mat = material_list[5]
		elif value == "6":
			mat = material_list[6]
		elif value == "7":
			mat = material_list[ 7]
		elif value == "8":
			mat =  material_list[ 8]
		elif value == "9":
			mat =  material_list[ 9]
		elif value == "RR":
			mat =  material_list[ 10]
		elif value == "Cut":
			mat = material_list[ 11]
		mesh.surface_set_material(face, mat)

