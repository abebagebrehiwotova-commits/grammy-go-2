extends Camera2D

@export var scroll_speed = 150.0

func _process(delta):
	# Die Kamera ist der Taktgeber
	position.x += scroll_speed * delta
