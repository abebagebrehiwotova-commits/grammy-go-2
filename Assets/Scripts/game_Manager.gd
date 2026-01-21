extends Node
class_name gameManager

var current_area = 1
var area_path="res://Assets/Scenes/Areas/"
var grocery_items=0



func _ready():
	reset_grocery_items()


func next_level():
	current_area +=1
	var full_path= area_path +"area_"+str(current_area)+".tscn"
	get_tree().change_scene_to_file(full_path)
	print("Grammy has reached the end of the aisle!")
	print("Let's hurry to the next level to finish the grocery-list")
	set_up_area()

func set_up_area():
	reset_grocery_items()

var item_db := {
	"oat_milk": preload("res://Assets/inventory/InvRes/oat_milk.tres"),
	"banana": preload("res://Assets/inventory/InvRes/banana.tres"),
	"flour": preload("res://Assets/inventory/InvRes/flour.tres"),
	"apple": preload("res://Assets/inventory/InvRes/apple.tres"),
	"blueberry": preload("res://Assets/inventory/InvRes/blueberry.tres"),
	"carrot": preload("res://Assets/inventory/InvRes/carrot.tres"),
	"egg": preload("res://Assets/inventory/InvRes/egg.tres"),
	"grape": preload("res://Assets/inventory/InvRes/grape.tres"),
	"honey": preload("res://Assets/inventory/InvRes/honey.tres"),
	"nut": preload("res://Assets/inventory/InvRes/nut.tres")
	}

#hinzugefügt 17.01
#Signal definieren für "emit_signal("inventory_changed")",in add_grocery_item.
signal inventory_changed

func add_grocery_item(item_name: String):
	grocery_items+=1
	print("Eingesammelt:", item_name)
#	es wird geprüft ob das Item einen Ressource counterpart hat.
	if not item_db.has(item_name):    
		print("Kein Resource-Counterpart für:", item_name)
#		Ressource holen
	var item_res = item_db[item_name]
	 # 2. Player finden
	var player = get_tree().get_first_node_in_group("player") as PlayerController
	if player == null:
		print("Kein Player in Gruppe 'player' gefunden")
	player.inv.items.erase(item_res)
<<<<<<< Updated upstream
	var inventory_ui = get_tree().get_first_node_in_group("inventory")
	inventory_ui.update_slots()
	
=======
>>>>>>> Stashed changes
	emit_signal("inventory_changed")
		#return
	if grocery_items >=9:
		var elevator =get_tree().get_first_node_in_group("area_exits") as AreaExit
		elevator.open()





#entfernt 17.01
#func add_grocery_item(item_name: String):
	#grocery_items += 1
	#print("Eingesammelt:", item_name)
#
	## 1. Kennen wir dieses Item?
	#if not item_db.has(item_name):
		#print("Kein Resource-Counterpart für:", item_name)
		#return

	 #2. Resource holen
	#var item_res = item_db[item_name]
#
	# 2. Player finden
	#var player = get_tree().get_first_node_in_group("player") as PlayerController
	#if player == null:
		#print("Kein Player in Gruppe 'player' gefunden")
		#return
#
	## 3. Ins Inventar legen
	#if player.inv == null:
		#print("Player hat kein Inventory zugewiesen")
		#return

	#player.inv.items.append(item_res)

	# 4. UI aktualisieren (optional)
	#update_inventory_ui()
#
	 #5. Dein bestehendes Gameplay
	#if grocery_items >= 1:
		#var elevator = get_tree().get_first_node_in_group("area_exits") as AreaExit
		#elevator.open()




func reset_grocery_items():
	grocery_items =0
