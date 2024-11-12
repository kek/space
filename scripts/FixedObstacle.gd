extends StaticBody3D
class_name FixedObstacle

func _init():
	print("Hello")

func _enter_tree():
	print("Entered tree")

func _ready():
	print("Ready")

static func _static_init():
	print("Static init")
