extends CollisionShape3D
class_name GameObject

func make_shape(type):
	var mesh = get_parent().\
		find_child("Model").\
		find_child("Body").\
		get_mesh()
	var collision_shape
	if type == "convex":
		collision_shape = mesh.create_convex_shape()
	elif type == "concave":
		collision_shape = mesh.create_trimesh_shape()
	else:
		print("Error")
	set_shape(collision_shape)
