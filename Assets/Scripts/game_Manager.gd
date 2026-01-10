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

func add_grocery_item():
	grocery_items+=1
	if grocery_items >=3:
		var elevator =get_tree().get_first_node_in_group("area_exits") as AreaExit
		elevator.open()


func reset_grocery_items():
	grocery_items =0
