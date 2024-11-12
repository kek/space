extends CollisionShape3D


func _ready():
	var mesh = get_parent().\
		find_child("Spaceship").\
		find_child("Cube").\
		get_mesh()
	var shape = mesh.create_convex_shape()
	set_shape(shape)


func _process(delta):
	pass
