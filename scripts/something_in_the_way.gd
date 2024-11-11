extends StaticBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var shape = get_parent().\
		find_child("Obstacle").\
		find_child("Sphere").\
		get_mesh().\
		create_convex_shape()
	var collision = get_parent().find_child("CollisionShape3D")
	collision.set_shape(shape)
	collision.scale = Vector3.ONE * 3


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
