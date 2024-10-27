extends PhysicsBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var ship = get_parent().find_child("PlayerShip")
	var shape = ship.find_child("Cube").get_mesh().create_convex_shape()
	var collision = get_parent().find_child("CollisionShape3D")
	collision.set_shape(shape)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var speed = 4
	move_and_collide(get_transform().basis.z.normalized() * delta * speed)

func _input(event):
	if Input.is_key_pressed(KEY_A):
		rotate_y(0.1)
	if Input.is_key_pressed(KEY_D):
		rotate_y(-0.1)
