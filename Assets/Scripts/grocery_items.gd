extends Area2D

@onready var sfx_pickup: AudioStreamPlayer2D = $"../../Player/sfx_pickup"


func _on_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		GameManager.add_grocery_item(name)
		sfx_pickup.play()
		queue_free()
