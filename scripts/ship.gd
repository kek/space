extends PhysicsBody3D


var speed = 0
var rot = Vector3(0,0,0)
var pitch = 0
var yaw = 0
var roll = 0
var turn_speed = 1

func _ready():
	pass

func _process(delta):
	
	var accel = 1
	
	if Input.is_key_pressed(KEY_W):
		speed += accel * delta
	if Input.is_key_pressed(KEY_S):
		speed += -accel * delta
	
	var movement = get_transform().basis.z.normalized() * delta * speed
	var coll = move_and_collide(movement)
	if coll:
		print(coll.get_collider())
	else:
		_steer(delta)

func _steer(delta):
	if Input.is_key_pressed(KEY_A):
		self.yaw += self.turn_speed * delta
	if Input.is_key_pressed(KEY_D):
		self.yaw += -self.turn_speed * delta
	if Input.is_key_pressed(KEY_LEFT):
		self.roll += -self.turn_speed * delta
	if Input.is_key_pressed(KEY_RIGHT):
		self.roll += self.turn_speed * delta
	if Input.is_key_pressed(KEY_UP):
		self.pitch += self.turn_speed * delta
	if Input.is_key_pressed(KEY_DOWN):
		self.pitch += -self.turn_speed * delta
	if Input.is_key_pressed(KEY_SPACE):
		self.pitch = 0
		self.yaw = 0
		self.roll = 0

	transform.basis = transform.basis.rotated(transform.basis.z, self.roll * delta)
	transform.basis = transform.basis.rotated(transform.basis.x, self.pitch * delta)
	transform.basis = transform.basis.rotated(transform.basis.y, self.yaw * delta)
	transform.basis = transform.basis.orthonormalized()
