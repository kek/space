extends CollisionShape3D

func _ready():
	var p = get_parent()
	var mesh = p.find_child("Model").find_child("Body").get_mesh()
	var collision_shape
	if p.get_meta("convex"):
		collision_shape = mesh.create_convex_shape()
	else:
		collision_shape = mesh.create_trimesh_shape()
	set_shape(collision_shape)
