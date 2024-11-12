extends PhysicsBody3D


func _ready():
	pass

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
