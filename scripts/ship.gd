extends PhysicsBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var shape = get_parent().\
		find_child("PlayerShip").\
		find_child("Cube").\
		get_mesh().\
		create_convex_shape()
	var collision = get_parent().find_child("CollisionShape3D")
	collision.set_shape(shape)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var speed = 0
	var turn_speed = 1
	if Input.is_key_pressed(KEY_UP):
		speed = 4
	if Input.is_key_pressed(KEY_DOWN):
		speed = -4
	if Input.is_key_pressed(KEY_LEFT):
		rotate_y(turn_speed * delta)
	if Input.is_key_pressed(KEY_RIGHT):
		rotate_y(-turn_speed * delta)

	var movement = get_transform().basis.z.normalized() * delta * speed
	var coll = move_and_collide(movement)
	if coll:
		print(coll.get_collider())
