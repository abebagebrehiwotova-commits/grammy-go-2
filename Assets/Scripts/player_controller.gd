extends CharacterBody2D
class_name PlayerController




<<<<<<< Updated upstream
#verschiedene Dinge für inventory
@export var inv:Inv
@onready var sfx_jump: AudioStreamPlayer2D = $sfx_jump
@onready var step_timer: Timer = $StepTimer
@onready var sfx_steps: AudioStreamPlayer2D = $sfx_steps
@onready var sfx_shoppingcart: AudioStreamPlayer2D = $sfx_shoppingcart
=======

#inventory-Dinge

>>>>>>> Stashed changes

# Inv_UI (Control) ist in der Scene Group "inventory",
# damit der PlayerController das Inventory-UI zur Laufzeit finden kann
#Zeile verweist Player auf das Inventory auf das über "groups" zugegriffen werden kann
#nächste Zeile legt Inv code in inv
@onready var inventory_ui = get_tree().get_first_node_in_group("inventory")
@export var inv:Inv

func _ready() -> void:
	inventory_ui.open()



#physics

@export var speed =10.0
@export var jump_power=10.0

var speed_multiplier=30.0
var jump_multiplier=-30.0
var direction=0

#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_power*jump_multiplier
<<<<<<< Updated upstream
		sfx_jump.play()

=======
>>>>>>> Stashed changes
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * speed * speed_multiplier
		
			
	else:
		velocity.x = move_toward(velocity.x, 0,speed * speed_multiplier)

	move_and_slide()
	
