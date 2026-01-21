extends Control

#variable for players inventory
@onready var inv:Inv=preload("res://Assets/inventory/playerInv.tres")
@onready var slots:Array=$NinePatchRect/GridContainer.get_children()


#variable to check if inventory is open or closed
var is_open = false

#function to make sure  inventory is closed at the beginning of the game
func _ready():
#<<<<<<< HEAD
	open()
	var gm = get_tree().get_first_node_in_group("game_manager") as GameManager
#=======
	close()

#>>>>>>> b8324574da511304f93de8a6fbfbc6ced68a4330
	if gm:
		gm.inventory_changed.connect(update_slots)
	update_slots()
	
func update_slots():
	# 1. Alles leeren(20.01)
	for slot in slots:
		slot.update(null)
	for i in range(min(inv.items.size(),slots.size())):
		slots[i].update(inv.items[i])

#process funcion for input
func open():
	visible=true
	is_open=true

#change visibilty
func close():
	visible = false
	is_open = false
#
#func toggle():
	#if is_open:
		#close()
	#else:
		#open()
