extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var mesh = find_child("Body").get_mesh()
	var shape = mesh.create_trimesh_shape()
	print(shape)
	var parent = StaticBody3D.new()
	var collision = CollisionShape3D.new()
	collision.set_shape(shape)
	collision.reparent(parent)
	reparent(parent)
	
	print(parent)
	
	#set_shape(shape)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
