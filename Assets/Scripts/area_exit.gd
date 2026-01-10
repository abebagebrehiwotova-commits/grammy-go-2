extends Area2D
class_name AreaExit

@export var sprite:Sprite2D

var is_open = false

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
	
	
func _ready():
	close()
	
func open():
	is_open =true
	sprite.region_rect.position.x=1180

func close():
	is_open =false
	sprite.region_rect.position.x=675

func _on_body_entered(body: Node2D) -> void:
	if is_open && body is PlayerController:
		GameManager.next_level()
