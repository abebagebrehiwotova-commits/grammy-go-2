extends Node

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

#func add_grocery_item(item_name: String):
	#grocery_items+=1
	#print("Eingesammelt:", item_name)
	#if grocery_items >=3:
		#var elevator =get_tree().get_first_node_in_group("area_exits") as AreaExit
		#elevator.open()



var item_db := {
	"oat_milk": preload("res://Assets/inventory/InvRes/oat_milk.tres"),
	"sugar": preload("res://Assets/inventory/InvRes/sugar.tres")}


func add_grocery_item(item_name: String):
	grocery_items += 1
	print("Eingesammelt:", item_name)

	# 1. Kennen wir dieses Item?
	if not item_db.has(item_name):
		print("Kein Resource-Counterpart für:", item_name)
		return

	# 2. Resource holen
	#var item_res = item_db[item_name]

	# 3. Ins Inventory legen
	#var player = get_tree().get_first_node_in_group("player")

	#player.inv.items.append(item_res)

	# 4. UI aktualisieren (falls du das schon hast)
	#update_inventory_ui()

	# 5. Dein bestehendes Gameplay
	if grocery_items >= 1:
		var elevator = get_tree().get_first_node_in_group("area_exits") as AreaExit
		elevator.open()



func reset_grocery_items():
	grocery_items =0
