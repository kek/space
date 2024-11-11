extends CollisionShape3D


func _ready():
	var mesh = get_parent().\
		find_child("PlayerShip").\
		find_child("Cube").\
		get_mesh()
	var shape = mesh.create_convex_shape()
	set_shape(shape)
	print("Shape")


func _process(delta):
	pass
